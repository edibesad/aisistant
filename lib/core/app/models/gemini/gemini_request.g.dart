// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiRequest _$GeminiRequestFromJson(Map<String, dynamic> json) =>
    GeminiRequest(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      generationConfig: json['generationConfig'] == null
          ? null
          : GenerationConfig.fromJson(
              json['generationConfig'] as Map<String, dynamic>),
      safetySettings: (json['safetySettings'] as List<dynamic>?)
          ?.map((e) => SafetySetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

// ignore: unused_element
abstract class _$GeminiRequestPerFieldToJson {
  // ignore: unused_element
  static Object? contents(List<Content>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? generationConfig(GenerationConfig? instance) =>
      instance?.toJson();
  // ignore: unused_element
  static Object? safetySettings(List<SafetySetting>? instance) =>
      instance?.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$GeminiRequestToJson(GeminiRequest instance) =>
    <String, dynamic>{
      'contents': instance.contents?.map((e) => e.toJson()).toList(),
      'generationConfig': instance.generationConfig?.toJson(),
      'safetySettings':
          instance.safetySettings?.map((e) => e.toJson()).toList(),
    };

SafetySetting _$SafetySettingFromJson(Map<String, dynamic> json) =>
    SafetySetting(
      category: $enumDecodeNullable(_$HarmCategoryEnumMap, json['category']),
      threshold:
          $enumDecodeNullable(_$HarmBlockThresholdEnumMap, json['threshold']),
    );

// ignore: unused_element
abstract class _$SafetySettingPerFieldToJson {
  // ignore: unused_element
  static Object? category(HarmCategory? instance) =>
      _$HarmCategoryEnumMap[instance];
  // ignore: unused_element
  static Object? threshold(HarmBlockThreshold? instance) =>
      _$HarmBlockThresholdEnumMap[instance];
}

Map<String, dynamic> _$SafetySettingToJson(SafetySetting instance) =>
    <String, dynamic>{
      'category': _$HarmCategoryEnumMap[instance.category],
      'threshold': _$HarmBlockThresholdEnumMap[instance.threshold],
    };

const _$HarmCategoryEnumMap = {
  HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT:
      'HARM_CATEGORY_SEXUALLY_EXPLICIT',
  HarmCategory.HARM_CATEGORY_HATE_SPEECH: 'HARM_CATEGORY_HATE_SPEECH',
  HarmCategory.HARM_CATEGORY_HARASSMENT: 'HARM_CATEGORY_HARASSMENT',
  HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT:
      'HARM_CATEGORY_DANGEROUS_CONTENT',
};

const _$HarmBlockThresholdEnumMap = {
  HarmBlockThreshold.HARM_BLOCK_THRESHOLD_UNSPECIFIED:
      'HARM_BLOCK_THRESHOLD_UNSPECIFIED',
  HarmBlockThreshold.BLOCK_LOW_AND_ABOVE: 'BLOCK_LOW_AND_ABOVE',
  HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE: 'BLOCK_MEDIUM_AND_ABOVE',
  HarmBlockThreshold.BLOCK_ONLY_HIGH: 'BLOCK_ONLY_HIGH',
  HarmBlockThreshold.BLOCK_NONE: 'BLOCK_NONE',
};

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String?,
    );

// ignore: unused_element
abstract class _$ContentPerFieldToJson {
  // ignore: unused_element
  static Object? parts(List<Part>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? role(String? instance) => instance;
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'parts': instance.parts?.map((e) => e.toJson()).toList(),
      'role': instance.role,
    };

InlineData _$InlineDataFromJson(Map<String, dynamic> json) => InlineData(
      mimeType: json['mimeType'] as String?,
      data: json['data'] as String?,
    );

// ignore: unused_element
abstract class _$InlineDataPerFieldToJson {
  // ignore: unused_element
  static Object? mimeType(String? instance) => instance;
  // ignore: unused_element
  static Object? data(String? instance) => instance;
}

Map<String, dynamic> _$InlineDataToJson(InlineData instance) =>
    <String, dynamic>{
      'mimeType': instance.mimeType,
      'data': instance.data,
    };

GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) =>
    GenerationConfig(
      stopSequences: (json['stopSequences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      candidateCount: json['candidateCount'] as int?,
      maxOutputTokens: json['maxOutputTokens'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      topK: json['topK'] as int?,
    );

// ignore: unused_element
abstract class _$GenerationConfigPerFieldToJson {
  // ignore: unused_element
  static Object? stopSequences(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? candidateCount(int? instance) => instance;
  // ignore: unused_element
  static Object? maxOutputTokens(int? instance) => instance;
  // ignore: unused_element
  static Object? temperature(double? instance) => instance;
  // ignore: unused_element
  static Object? topP(double? instance) => instance;
  // ignore: unused_element
  static Object? topK(int? instance) => instance;
}

Map<String, dynamic> _$GenerationConfigToJson(GenerationConfig instance) =>
    <String, dynamic>{
      'stopSequences': instance.stopSequences,
      'candidateCount': instance.candidateCount,
      'maxOutputTokens': instance.maxOutputTokens,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'topK': instance.topK,
    };
