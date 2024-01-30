import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  Chat({required this.id, required this.title});

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  int id;
  String title;

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
