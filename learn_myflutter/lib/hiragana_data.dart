import 'package:json_annotation/json_annotation.dart';

part 'hiragana_data.g.dart';


/* リクエスト */
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class YahooRubiRequest {
  final String id;
  final String jsonrpc;
  final String method;
  final YahooRubiParams params;

  const YahooRubiRequest({
    required this.id,
    this.jsonrpc = "2.0",
    this.method = "jlp.furiganaservice.furigana",
    required this.params,
  });

  factory YahooRubiRequest.fromJson(Map<String, dynamic> json) {
    return _$YahooRubiRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YahooRubiRequestToJson(this);
}


@JsonSerializable(fieldRename: FieldRename.snake)
class YahooRubiParams {
  final String q;
  final int grade;

  const YahooRubiParams({required this.q, this.grade = 1});

  factory YahooRubiParams.fromJson(Map<String, dynamic> json) {
    return _$YahooRubiParamsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YahooRubiParamsToJson(this);
}


/*レスポンス*/
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class YahooRubiResponse {
  final String id;
  final String jsonrpc;
  final YahooRubiResult result;

  const YahooRubiResponse({
    required this.id,
    required this.jsonrpc,
    required this.result,
  });

  factory YahooRubiResponse.fromJson(Map<String, dynamic> json) {
    return _$YahooRubiResponseFromJson(json);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class YahooRubiResult {
  final List<Map<String, dynamic>> word;

  YahooRubiResult({required this.word});

  factory YahooRubiResult.fromJson(Map<String, dynamic> json) {
    return _$YahooRubiResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YahooRubiResultToJson(this);
}


