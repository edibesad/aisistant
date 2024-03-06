import 'package:json_annotation/json_annotation.dart';

import 'gemini_response.dart';

part 'gemini_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class GeminiRequest {
  GeminiRequest({
    this.contents,
    this.generationConfig,
    this.safetySettings,
  });
  factory GeminiRequest.fromJson(Map<String, dynamic> json) =>
      _$GeminiRequestFromJson(json);
  final List<Content>? contents;
  final GenerationConfig? generationConfig;
  final List<SafetySetting>? safetySettings;
  Map<String, dynamic> toJson() => _$GeminiRequestToJson(this);
}

@JsonSerializable()
class SafetySetting {
  SafetySetting({
    this.category,
    this.threshold,
  });

  factory SafetySetting.fromJson(Map<String, dynamic> json) =>
      _$SafetySettingFromJson(json);

  HarmCategory? category;
  HarmBlockThreshold? threshold;
  Map<String, dynamic> toJson() => _$SafetySettingToJson(this);
}

enum HarmBlockThreshold {
  @JsonValue('HARM_BLOCK_THRESHOLD_UNSPECIFIED')
  HARM_BLOCK_THRESHOLD_UNSPECIFIED,
  @JsonValue('BLOCK_LOW_AND_ABOVE')
  BLOCK_LOW_AND_ABOVE,
  @JsonValue('BLOCK_MEDIUM_AND_ABOVE')
  BLOCK_MEDIUM_AND_ABOVE,
  @JsonValue('BLOCK_ONLY_HIGH')
  BLOCK_ONLY_HIGH,
  @JsonValue('BLOCK_NONE')
  BLOCK_NONE,
}

@JsonSerializable()
class Content {
  const Content({
    this.parts,
    this.role,
  });
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  final List<Part>? parts;
  final Role? role;
  Map<String, dynamic> toJson() => _$ContentToJson(this);

  String? roleToString() {
    if (role == null) {
      return null;
    }
    switch (role!) {
      case Role.USER:
        return 'user';
      case Role.MODEL:
        return 'model';
    }
  }
}

enum Role {
  @JsonValue('user')
  USER,
  @JsonValue('model')
  MODEL,
}

@JsonSerializable()
class InlineData {
  InlineData({
    this.mimeType,
    this.data,
  });
  factory InlineData.fromJson(Map<String, dynamic> json) =>
      _$InlineDataFromJson(json);
  String? mimeType;
  String? data;
  Map<String, dynamic> toJson() => _$InlineDataToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
)
class GenerationConfig {
  GenerationConfig({
    this.stopSequences,
    this.candidateCount,
    this.maxOutputTokens,
    this.temperature,
    this.topP,
    this.topK,
  });
  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);
  List<String>? stopSequences;
  int? candidateCount;
  int? maxOutputTokens;
  double? temperature;
  double? topP;
  int? topK;
  Map<String, dynamic> toJson() => _$GenerationConfigToJson(this);
}
