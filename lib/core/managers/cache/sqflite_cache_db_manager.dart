import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../app/models/chat.dart';
import '../../app/models/gemini/gemini_request.dart';
import '../../app/models/gemini/gemini_response.dart';
import '../../services/cache_db_service.dart';

class SQFLiteCacheDBManager extends CacheDBService {
  factory SQFLiteCacheDBManager() {
    _instance ??= SQFLiteCacheDBManager._init();
    return _instance!;
  }

  SQFLiteCacheDBManager._init() {
    _initDatabase();
  }

  late Database _database;
  static SQFLiteCacheDBManager? _instance;

  Future<void> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = '$databasePath/chat.db';
    log(path);
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  @override
  Future<List<Chat>> getChats() {
    try {
      return _database
          .rawQuery('SELECT id,title FROM chat_table ORDER BY id DESC')
          .then((value) => value.map((e) => Chat.fromJson(e)).toList());
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return Future.value(<Chat>[]);
    }
  }

  @override
  Future<bool> deleteChat(int chatId) async {
    try {
      await _database
          .rawDelete('DELETE FROM chat_table WHERE id = ?', [chatId]);
      return true;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return false;
    }
  }

  @override
  Future<List<Content>> getMesagesByChatId(int chatId) async {
    try {
      final List<Map<dynamic, dynamic>> tempMessages = await _database.rawQuery(
          'SELECT id,role FROM message_table WHERE chat_id = ?', [chatId]);

      final List<Map<dynamic, dynamic>> messages = [];

      for (final Map<dynamic, dynamic> message in tempMessages) {
        final tempMap = Map<String, dynamic>.from(message);

        tempMap.addAll({
          'parts': await _database.rawQuery(
              'SELECT message as text FROM message_part_table WHERE message_id = ?',
              [message['id']])
        });
        log(tempMap.toString());
        messages.add(tempMap);
      }
      return messages
          .map((e) => Content.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return <Content>[];
    }
  }

  @override
  Future<int> insertChat(String? title) async {
    try {
      return await _database
          .rawInsert('INSERT INTO chat_table (title) VALUES (?)', [title]);
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return -1;
    }
  }

  @override
  Future<bool> insertMessage(Content content, int chatId) async {
    try {
      final int id = await _database.rawInsert(
          'INSERT INTO message_table (chat_id, role) VALUES (?, ?)',
          [chatId, content.roleToString()]);
      for (final Part element in content.parts!) {
        _database.rawInsert(
            'INSERT INTO message_part_table (message, message_id) VALUES (?, ?)',
            [element.text, id]);
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return false;
    }
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE chat_table (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL)');
      await db.execute(
          'CREATE TABLE message_table (id INTEGER PRIMARY KEY AUTOINCREMENT, chat_id INTEGER NOT NULL, role TEXT NOT NULL, FOREIGN KEY (chat_id) REFERENCES chat_table(id) ON DELETE CASCADE)');
      await db.execute(
          'CREATE TABLE message_part_table (id INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT NOT NULL, message_id INTEGER NOT NULL, FOREIGN KEY (message_id) REFERENCES message_table(id) ON DELETE CASCADE)');
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
    }
  }
}
