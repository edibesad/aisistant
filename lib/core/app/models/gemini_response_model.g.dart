// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiResponseModel _$GeminiResponseModelFromJson(Map<String, dynamic> json) =>
    GeminiResponseModel(
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptFeedback: json['promptFeedback'] == null
          ? null
          : PromptFeedback.fromJson(
              json['promptFeedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeminiResponseModelToJson(
        GeminiResponseModel instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'promptFeedback': instance.promptFeedback,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
      citationMetadata: json['citationMetadata'] == null
          ? null
          : CitationMetadata.fromJson(
              json['citationMetadata'] as Map<String, dynamic>),
      finishReason:
          $enumDecodeNullable(_$FinishReasonEnumMap, json['finishReason']),
    );

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'content': instance.content,
      'safetyRatings': instance.safetyRatings,
      'citationMetadata': instance.citationMetadata,
      'finishReason': _$FinishReasonEnumMap[instance.finishReason],
    };

const _$FinishReasonEnumMap = {
  FinishReason.FINISH_REASON_UNSPECIFIED: 'UNSPECIFIED',
  FinishReason.FINISH_REASON_STOP: 'STOP',
  FinishReason.FINISH_REASON_MAX_TOKENS: 'MAX_TOKENS',
  FinishReason.FINISH_REASON_SAFETY: 'SAFETY',
  FinishReason.FINISH_REASON_RECITATION: 'RECITATION',
  FinishReason.FINISH_REASON_OTHER: 'OTHER',
};

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Parts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'parts': instance.parts,
    };

Parts _$PartsFromJson(Map<String, dynamic> json) => Parts(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PartsToJson(Parts instance) => <String, dynamic>{
      'text': instance.text,
    };

SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) => SafetyRating(
      blocked: json['blocked'] as bool?,
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
      probability:
          $enumDecodeNullable(_$ProbabilityEnumMap, json['probability']),
    );

Map<String, dynamic> _$SafetyRatingToJson(SafetyRating instance) =>
    <String, dynamic>{
      'blocked': instance.blocked,
      'category': _$CategoryEnumMap[instance.category],
      'probability': _$ProbabilityEnumMap[instance.probability],
    };

const _$CategoryEnumMap = {
  Category.HARM_CATEGORY_SEXUALLY_EXPLICIT: 'HARM_CATEGORY_SEXUALLY_EXPLICIT',
  Category.HARM_CATEGORY_HATE_SPEECH: 'HARM_CATEGORY_HATE_SPEECH',
  Category.HARM_CATEGORY_HARASSMENT: 'HARM_CATEGORY_HARASSMENT',
  Category.HARM_CATEGORY_DANGEROUS_CONTENT: 'HARM_CATEGORY_DANGEROUS_CONTENT',
};

const _$ProbabilityEnumMap = {
  Probability.HARM_PROBABILITY_UNSPECIFIED: 'HARM_PROBABILITY_UNSPECIFIED',
  Probability.NEGLIGIBLE: 'NEGLIGIBLE',
  Probability.LOW: 'LOW',
  Probability.MEDIUM: 'MEDIUM',
  Probability.HIGH: 'HIGH',
};

CitationMetadata _$CitationMetadataFromJson(Map<String, dynamic> json) =>
    CitationMetadata(
      citations: (json['citations'] as List<dynamic>?)
          ?.map((e) => Citations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitationMetadataToJson(CitationMetadata instance) =>
    <String, dynamic>{
      'citations': instance.citations,
    };

Citations _$CitationsFromJson(Map<String, dynamic> json) => Citations(
      startIndex: json['startIndex'] as int?,
      endIndex: json['endIndex'] as int?,
      uri: json['uri'] as String?,
      title: json['title'] as String?,
      license: json['license'] as String?,
      publicationDate: json['publicationDate'] == null
          ? null
          : PublicationDate.fromJson(
              json['publicationDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitationsToJson(Citations instance) => <String, dynamic>{
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'uri': instance.uri,
      'title': instance.title,
      'license': instance.license,
      'publicationDate': instance.publicationDate,
    };

PublicationDate _$PublicationDateFromJson(Map<String, dynamic> json) =>
    PublicationDate(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
    );

Map<String, dynamic> _$PublicationDateToJson(PublicationDate instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };

UsageMetadata _$UsageMetadataFromJson(Map<String, dynamic> json) =>
    UsageMetadata(
      promptTokenCount: json['promptTokenCount'] as int?,
      candidatesTokenCount: json['candidatesTokenCount'] as int?,
      totalTokenCount: json['totalTokenCount'] as int?,
    );

Map<String, dynamic> _$UsageMetadataToJson(UsageMetadata instance) =>
    <String, dynamic>{
      'promptTokenCount': instance.promptTokenCount,
      'candidatesTokenCount': instance.candidatesTokenCount,
      'totalTokenCount': instance.totalTokenCount,
    };

PromptFeedback _$PromptFeedbackFromJson(Map<String, dynamic> json) =>
    PromptFeedback(
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
          ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromptFeedbackToJson(PromptFeedback instance) =>
    <String, dynamic>{
      'safetyRatings': instance.safetyRatings,
    };
