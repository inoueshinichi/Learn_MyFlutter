import 'dart:convert';

import 'hiragana_state.dart';
import 'hiragana_data.dart';
import 'hiragana.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;


part 'hiragana_notifier_provider.g.dart';


@riverpod
class HiraganaNotifier extends _$HiraganaNotifier {
  @override
  HiraganaAppState build() {
    return const HiraganaInput(); // 初期state
  }

  void reset() {
    state = const HiraganaInput();
  }

  Future<void> convert(String sentence, {int grade = 1, String id = "1234"}) async {
    state = const HiraganaLoading();

    final url = Uri.parse('https://jlp.yahooapis.jp/FuriganaService/V2/furigana');
    final headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'Yahoo AppID: ${const String.fromEnvironment("yahooAppID")}'
    };

    final params = YahooRubiParams(q: sentence, grade: grade);
    final request = YahooRubiRequest(id: id, params: params);

    final result = await http.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    final resVal = YahooRubiResponse.fromJson(jsonDecode(result.body) as Map<String, dynamic>);
    List<String> hiraganaList = [];
    for (var token in resVal.result.word) {
      final {"furigana": furigana, "roman": roman, "surface": surface} = token;
      hiraganaList.add(furigana);
    }

    state = HiraganaData(hiraganaList.join());
  }
}