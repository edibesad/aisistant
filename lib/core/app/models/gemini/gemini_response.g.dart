// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeminiResponse _$GeminiResponseFromJson(Map<String, dynamic> json) =>
    GeminiResponse(
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptFeedback: json['promptFeedback'] == null
          ? null
          : PromptFeedback.fromJson(
              json['promptFeedback'] as Map<String, dynamic>),
    );

// ignore: unused_element
abstract class _$GeminiResponsePerFieldToJson {
  // ignore: unused_element
  static Object? candidates(List<Candidate>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? promptFeedback(PromptFeedback? instance) => instance?.toJson();
}

Map<String, dynamic> _$GeminiResponseToJson(GeminiResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates?.map((e) => e.toJson()).toList(),
      'promptFeedback': instance.promptFeedback?.toJson(),
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

// ignore: unused_element
abstract class _$CandidatePerFieldToJson {
  // ignore: unused_element
  static Object? content(Content? instance) => instance?.toJson();
  // ignore: unused_element
  static Object? safetyRatings(List<SafetyRating>? instance) =>
      instance?.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? citationMetadata(CitationMetadata? instance) =>
      instance?.toJson();
  // ignore: unused_element
  static Object? finishReason(FinishReason? instance) =>
      _$FinishReasonEnumMap[instance];
}

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
      'content': instance.content?.toJson(),
      'safetyRatings': instance.safetyRatings?.map((e) => e.toJson()).toList(),
      'citationMetadata': instance.citationMetadata?.toJson(),
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

SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) => SafetyRating(
      blocked: json['blocked'] as bool?,
      category: $enumDecodeNullable(_$HarmCategoryEnumMap, json['category']),
      probability:
          $enumDecodeNullable(_$ProbabilityEnumMap, json['probability']),
    );

// ignore: unused_element
abstract class _$SafetyRatingPerFieldToJson {
  // ignore: unused_element
  static Object? blocked(bool? instance) => instance;
  // ignore: unused_element
  static Object? category(HarmCategory? instance) =>
      _$HarmCategoryEnumMap[instance];
  // ignore: unused_element
  static Object? probability(Probability? instance) =>
      _$ProbabilityEnumMap[instance];
}

Map<String, dynamic> _$SafetyRatingToJson(SafetyRating instance) =>
    <String, dynamic>{
      'blocked': instance.blocked,
      'category': _$HarmCategoryEnumMap[instance.category],
      'probability': _$ProbabilityEnumMap[instance.probability],
    };

const _$HarmCategoryEnumMap = {
  HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT:
      'HARM_CATEGORY_SEXUALLY_EXPLICIT',
  HarmCategory.HARM_CATEGORY_HATE_SPEECH: 'HARM_CATEGORY_HATE_SPEECH',
  HarmCategory.HARM_CATEGORY_HARASSMENT: 'HARM_CATEGORY_HARASSMENT',
  HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT:
      'HARM_CATEGORY_DANGEROUS_CONTENT',
};

const _$ProbabilityEnumMap = {
  Probability.HARM_PROBABILITY_UNSPECIFIED: 'HARM_PROBABILITY_UNSPECIFIED',
  Probability.NEGLIGIBLE: 'NEGLIGIBLE',
  Probability.LOW: 'LOW',
  Probability.MEDIUM: 'MEDIUM',
  Probability.HIGH: 'HIGH',
};

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      text: json['text'] as String?,
      inlineData: json['inlineData'] == null
          ? null
          : InlineData.fromJson(json['inlineData'] as Map<String, dynamic>),
    );

// ignore: unused_element
abstract class _$PartPerFieldToJson {
  // ignore: unused_element
  static Object? text(String? instance) => instance;
  // ignore: unused_element
  static Object? inlineData(InlineData? instance) => instance?.toJson();
}

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'text': instance.text,
      'inlineData': instance.inlineData?.toJson(),
    };

CitationMetadata _$CitationMetadataFromJson(Map<String, dynamic> json) =>
    CitationMetadata(
      citations: (json['citations'] as List<dynamic>?)
          ?.map((e) => Citations.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

// ignore: unused_element
abstract class _$CitationMetadataPerFieldToJson {
  // ignore: unused_element
  static Object? citations(List<Citations>? instance) =>
      instance?.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$CitationMetadataToJson(CitationMetadata instance) =>
    <String, dynamic>{
      'citations': instance.citations?.map((e) => e.toJson()).toList(),
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

// ignore: unused_element
abstract class _$CitationsPerFieldToJson {
  // ignore: unused_element
  static Object? startIndex(int? instance) => instance;
  // ignore: unused_element
  static Object? endIndex(int? instance) => instance;
  // ignore: unused_element
  static Object? uri(String? instance) => instance;
  // ignore: unused_element
  static Object? title(String? instance) => instance;
  // ignore: unused_element
  static Object? license(String? instance) => instance;
  // ignore: unused_element
  static Object? publicationDate(PublicationDate? instance) =>
      instance?.toJson();
}

Map<String, dynamic> _$CitationsToJson(Citations instance) => <String, dynamic>{
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'uri': instance.uri,
      'title': instance.title,
      'license': instance.license,
      'publicationDate': instance.publicationDate?.toJson(),
    };

PublicationDate _$PublicationDateFromJson(Map<String, dynamic> json) =>
    PublicationDate(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
    );

// ignore: unused_element
abstract class _$PublicationDatePerFieldToJson {
  // ignore: unused_element
  static Object? year(int? instance) => instance;
  // ignore: unused_element
  static Object? month(int? instance) => instance;
  // ignore: unused_element
  static Object? day(int? instance) => instance;
}

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

// ignore: unused_element
abstract class _$UsageMetadataPerFieldToJson {
  // ignore: unused_element
  static Object? promptTokenCount(int? instance) => instance;
  // ignore: unused_element
  static Object? candidatesTokenCount(int? instance) => instance;
  // ignore: unused_element
  static Object? totalTokenCount(int? instance) => instance;
}

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

// ignore: unused_element
abstract class _$PromptFeedbackPerFieldToJson {
  // ignore: unused_element
  static Object? safetyRatings(List<SafetyRating>? instance) =>
      instance?.map((e) => e.toJson()).toList();
}

Map<String, dynamic> _$PromptFeedbackToJson(PromptFeedback instance) =>
    <String, dynamic>{
      'safetyRatings': instance.safetyRatings?.map((e) => e.toJson()).toList(),
    };
