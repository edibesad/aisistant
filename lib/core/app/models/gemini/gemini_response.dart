// ignore_for_file: constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import 'gemini_request.dart';

part 'gemini_response.g.dart';

@JsonSerializable()
class GeminiResponse {
  GeminiResponse({
    this.candidates,
    this.promptFeedback,
  });
  factory GeminiResponse.fromJson(Map<String, dynamic> json) =>
      _$GeminiResponseFromJson(json);

  final List<Candidate>? candidates;
  final PromptFeedback? promptFeedback;

  Map<String, dynamic> toJson() => _$GeminiResponseToJson(this);
}

@JsonSerializable()
class Candidate {
  Candidate(
      {this.content,
      this.safetyRatings,
      this.citationMetadata,
      this.finishReason,
      this.tokenCount});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);
  final Content? content;

  final List<SafetyRating>? safetyRatings;
  final CitationMetadata? citationMetadata;
  final FinishReason? finishReason;
  final int? tokenCount;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

@JsonEnum(valueField: 'finishReason')
enum FinishReason {
  @JsonValue('UNSPECIFIED')
  FINISH_REASON_UNSPECIFIED,
  @JsonValue('STOP')
  FINISH_REASON_STOP,
  @JsonValue('MAX_TOKENS')
  FINISH_REASON_MAX_TOKENS,
  @JsonValue('SAFETY')
  FINISH_REASON_SAFETY,
  @JsonValue('RECITATION')
  FINISH_REASON_RECITATION,
  @JsonValue('OTHER')
  FINISH_REASON_OTHER
}

@JsonSerializable()
class SafetyRating {
  SafetyRating({this.blocked, this.category, this.probability});
  factory SafetyRating.fromJson(Map<String, dynamic> json) =>
      _$SafetyRatingFromJson(json);
  final bool? blocked;
  final HarmCategory? category;
  final Probability? probability;
  Map<String, dynamic> toJson() => _$SafetyRatingToJson(this);
}

@JsonSerializable()
class Part {
  const Part({
    this.text,
    this.inlineData,
  });
  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);
  final String? text;
  final InlineData? inlineData;
  Map<String, dynamic> toJson() => _$PartToJson(this);
}

enum HarmCategory {
  @JsonValue('HARM_CATEGORY_SEXUALLY_EXPLICIT')
  HARM_CATEGORY_SEXUALLY_EXPLICIT,
  @JsonValue('HARM_CATEGORY_HATE_SPEECH')
  HARM_CATEGORY_HATE_SPEECH,
  @JsonValue('HARM_CATEGORY_HARASSMENT')
  HARM_CATEGORY_HARASSMENT,
  @JsonValue('HARM_CATEGORY_DANGEROUS_CONTENT')
  HARM_CATEGORY_DANGEROUS_CONTENT
}

enum Probability {
  @JsonValue('HARM_PROBABILITY_UNSPECIFIED')
  HARM_PROBABILITY_UNSPECIFIED,
  @JsonValue('NEGLIGIBLE')
  NEGLIGIBLE,
  @JsonValue('LOW')
  LOW,
  @JsonValue('MEDIUM')
  MEDIUM,
  @JsonValue('HIGH')
  HIGH
}

@JsonSerializable()
class CitationMetadata {
  CitationMetadata({this.citations});

  factory CitationMetadata.fromJson(Map<String, dynamic> json) =>
      _$CitationMetadataFromJson(json);
  List<Citations>? citations;
  Map<String, dynamic> toJson() => _$CitationMetadataToJson(this);
}

@JsonSerializable()
class Citations {
  Citations({
    this.startIndex,
    this.endIndex,
    this.uri,
    this.title,
    this.license,
    this.publicationDate,
  });
  factory Citations.fromJson(Map<String, dynamic> json) =>
      _$CitationsFromJson(json);
  final int? startIndex;
  final int? endIndex;
  final String? uri;
  final String? title;
  final String? license;
  final PublicationDate? publicationDate;
  Map<String, dynamic> toJson() => _$CitationsToJson(this);
}

@JsonSerializable()
class PublicationDate {
  PublicationDate({this.year, this.month, this.day});

  factory PublicationDate.fromJson(Map<String, dynamic> json) =>
      _$PublicationDateFromJson(json);
  final int? year;
  final int? month;
  final int? day;
  Map<String, dynamic> toJson() => _$PublicationDateToJson(this);
}

@JsonSerializable()
class UsageMetadata {
  UsageMetadata({
    this.promptTokenCount,
    this.candidatesTokenCount,
    this.totalTokenCount,
  });

  factory UsageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UsageMetadataFromJson(json);
  final int? promptTokenCount;
  final int? candidatesTokenCount;
  final int? totalTokenCount;
  Map<String, dynamic> toJson() => _$UsageMetadataToJson(this);
}

@JsonSerializable()
class PromptFeedback {
  PromptFeedback({
    this.safetyRatings,
  });
  factory PromptFeedback.fromJson(Map<String, dynamic> json) =>
      _$PromptFeedbackFromJson(json);
  final List<SafetyRating>? safetyRatings;
  Map<String, dynamic> toJson() => _$PromptFeedbackToJson(this);
}
