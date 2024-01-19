// ignore_for_file: constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'gemini_response_model.g.dart';

@JsonSerializable()
class GeminiResponseModel {
  List<Candidate>? candidates;
  PromptFeedback? promptFeedback;

  GeminiResponseModel({
    this.candidates,
    this.promptFeedback,
  });
  factory GeminiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeminiResponseModelToJson(this);
}

@JsonSerializable()
class Candidate {
  Content? content;
  List<SafetyRating>? safetyRatings;
  CitationMetadata? citationMetadata;
  FinishReason? finishReason;

  Candidate(
      {this.content,
      this.safetyRatings,
      this.citationMetadata,
      this.finishReason});
  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);
  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

@JsonEnum(valueField: 'finishReason')
enum FinishReason {
  @JsonValue("UNSPECIFIED")
  FINISH_REASON_UNSPECIFIED,
  @JsonValue("STOP")
  FINISH_REASON_STOP,
  @JsonValue("MAX_TOKENS")
  FINISH_REASON_MAX_TOKENS,
  @JsonValue("SAFETY")
  FINISH_REASON_SAFETY,
  @JsonValue("RECITATION")
  FINISH_REASON_RECITATION,
  @JsonValue("OTHER")
  FINISH_REASON_OTHER
}

@JsonSerializable()
class Content {
  List<Parts>? parts;

  Content({this.parts});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Parts {
  String? text;

  Parts({this.text});

  factory Parts.fromJson(Map<String, dynamic> json) => _$PartsFromJson(json);
  Map<String, dynamic> toJson() => _$PartsToJson(this);
}

@JsonSerializable()
class SafetyRating {
  bool? blocked;
  Category? category;
  Probability? probability;
  SafetyRating({this.blocked, this.category, this.probability});
  factory SafetyRating.fromJson(Map<String, dynamic> json) =>
      _$SafetyRatingFromJson(json);
  Map<String, dynamic> toJson() => _$SafetyRatingToJson(this);
}

enum Category {
  @JsonValue("HARM_CATEGORY_SEXUALLY_EXPLICIT")
  HARM_CATEGORY_SEXUALLY_EXPLICIT,
  @JsonValue("HARM_CATEGORY_HATE_SPEECH")
  HARM_CATEGORY_HATE_SPEECH,
  @JsonValue("HARM_CATEGORY_HARASSMENT")
  HARM_CATEGORY_HARASSMENT,
  @JsonValue("HARM_CATEGORY_DANGEROUS_CONTENT")
  HARM_CATEGORY_DANGEROUS_CONTENT
}

enum Probability {
  @JsonValue("HARM_PROBABILITY_UNSPECIFIED")
  HARM_PROBABILITY_UNSPECIFIED,
  @JsonValue("NEGLIGIBLE")
  NEGLIGIBLE,
  @JsonValue("LOW")
  LOW,
  @JsonValue("MEDIUM")
  MEDIUM,
  @JsonValue("HIGH")
  HIGH
}

@JsonSerializable()
class CitationMetadata {
  List<Citations>? citations;

  CitationMetadata({this.citations});

  factory CitationMetadata.fromJson(Map<String, dynamic> json) =>
      _$CitationMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$CitationMetadataToJson(this);
}

@JsonSerializable()
class Citations {
  int? startIndex;
  int? endIndex;
  String? uri;
  String? title;
  String? license;
  PublicationDate? publicationDate;

  Citations(
      {this.startIndex,
      this.endIndex,
      this.uri,
      this.title,
      this.license,
      this.publicationDate});
  factory Citations.fromJson(Map<String, dynamic> json) =>
      _$CitationsFromJson(json);
  Map<String, dynamic> toJson() => _$CitationsToJson(this);
}

@JsonSerializable()
class PublicationDate {
  int? year;
  int? month;
  int? day;

  PublicationDate({this.year, this.month, this.day});

  factory PublicationDate.fromJson(Map<String, dynamic> json) =>
      _$PublicationDateFromJson(json);
  Map<String, dynamic> toJson() => _$PublicationDateToJson(this);
}

@JsonSerializable()
class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;

  UsageMetadata(
      {this.promptTokenCount, this.candidatesTokenCount, this.totalTokenCount});

  factory UsageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UsageMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$UsageMetadataToJson(this);
}

@JsonSerializable()
class PromptFeedback {
  List<SafetyRating>? safetyRatings;

  PromptFeedback({
    this.safetyRatings,
  });
  factory PromptFeedback.fromJson(Map<String, dynamic> json) =>
      _$PromptFeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$PromptFeedbackToJson(this);
}
