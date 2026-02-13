// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiragana_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YahooRubiRequest _$YahooRubiRequestFromJson(Map<String, dynamic> json) =>
    YahooRubiRequest(
      id: json['id'] as String,
      jsonrpc: json['jsonrpc'] as String? ?? "2.0",
      method: json['method'] as String? ?? "jlp.furiganaservice.furigana",
      params: YahooRubiParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YahooRubiRequestToJson(YahooRubiRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jsonrpc': instance.jsonrpc,
      'method': instance.method,
      'params': instance.params.toJson(),
    };

YahooRubiParams _$YahooRubiParamsFromJson(Map<String, dynamic> json) =>
    YahooRubiParams(
      q: json['q'] as String,
      grade: (json['grade'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$YahooRubiParamsToJson(YahooRubiParams instance) =>
    <String, dynamic>{'q': instance.q, 'grade': instance.grade};

YahooRubiResponse _$YahooRubiResponseFromJson(Map<String, dynamic> json) =>
    YahooRubiResponse(
      id: json['id'] as String,
      jsonrpc: json['jsonrpc'] as String,
      result: YahooRubiResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YahooRubiResponseToJson(YahooRubiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jsonrpc': instance.jsonrpc,
      'result': instance.result.toJson(),
    };

YahooRubiResult _$YahooRubiResultFromJson(Map<String, dynamic> json) =>
    YahooRubiResult(
      word:
          (json['word'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
    );

Map<String, dynamic> _$YahooRubiResultToJson(YahooRubiResult instance) =>
    <String, dynamic>{'word': instance.word};
