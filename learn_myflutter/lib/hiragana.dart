import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn_myflutter/hiragana_state.dart';

import 'hiragana_data.dart';
import 'hiragana_notifier_provider.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';


/* ConsumerWidgetを継承するために入れ替え */
// class HiraganaStartPage extends StatelessWidget {
//   const HiraganaStartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: const Text(
//             'Hiragana',
//             style: TextStyle(fontSize: 30, color: Colors.white),
//         ),
//       ),
//       body: HiraganaInputForm(),
//     );
//   }
// }


/* ConsumerStatefulWidgetを継承するために入れ替え */
// class HiraganaInputForm extends StatefulWidget {
//   const HiraganaInputForm({super.key});
//
//   @override
//   State<HiraganaInputForm> createState() => HiraganaInputFormState();
// }

/* ConsumerStateを使うため入れ替え */
// class HiraganaInputFormState extends State<HiraganaInputForm> {
//
//   final formKey = GlobalKey<FormState>();
//   final textEditingController = TextEditingController();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     textEditingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     // throw UnimplementedError();
//     return Form(
//       key: formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: TextFormField(
//               controller: textEditingController,
//               maxLines: 5,
//               decoration: const InputDecoration(
//                 hintText: "文章を入力してください",
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "文章が入力されていません。";
//                 }
//                 return null;
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             // onPressed: () {
//             //   final formState = formKey.currentState!;
//             //   formState.validate();
//             //   debugPrint('text = ${textEditingController.text}');
//             // },
//             onPressed: _yahooRubiWebAPI,
//             child: const Text('変換'),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Future<void> _yahooRubiWebAPI() async {
//     final formState = formKey.currentState!;
//     if (!formState.validate()) {
//       return;
//     }
//
//     // const appID = String.fromEnvironment("yahooAppID");
//     // debugPrint("[User-Agent] Yahoo AppID: $appID");
//
//     final url = Uri.parse('https://jlp.yahooapis.jp/FuriganaService/V2/furigana');
//     final headers = {
//       'Content-Type': 'application/json',
//       'User-Agent': 'Yahoo AppID: ${const String.fromEnvironment("yahooAppID")}'
//     };
//
//     final params = YahooRubiParams(q: textEditingController.text, grade: 1);
//     final request = YahooRubiRequest(id: "1234", params: params);
//
//     final result = await http.post(
//       url,
//       headers: headers,
//       body: jsonEncode(request.toJson()),
//     );
//
//     final response = jsonDecode(result.body) as Map<String, dynamic>;
//     debugPrint('変換結果: ${response}');
//     // final resId = response['id'] as String;
//     // final resJsonRPC = response['jsonrpc'] as String;
//     // final resResult = response['result'];
//     // final words = resResult['word'];
//     // var hiraganaList = <String>[];
//     // for (Map<String, Object?> token in words) {
//     //   debugPrint('$token');
//     //   hiraganaList.add(token['furigana'] as String);
//     // }
//     // debugPrint('フリガナ: ${hiraganaList}');
//
//     final resVal = YahooRubiResponse.fromJson(jsonDecode(result.body) as Map<String, dynamic>);
//     debugPrint('resVal: ${resVal.toString()}');
//
//     debugPrint('id: ${resVal.id}');
//     debugPrint('jsonrpc: ${resVal.jsonrpc}');
//     debugPrint('result: ${resVal.result}');
//     for (var token in resVal.result.word) {
//       final {"furigana": furigana, "roman": roman, "surface": surface} = token;
//       debugPrint('$token : $furigana, $roman, $surface');
//     }
//   }
// }


class HiraganaStartPage extends ConsumerWidget {
  const HiraganaStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    final webApiState = ref.watch(hiraganaNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hiragana Converter'),
      ),
      body: switch (webApiState) {
        HiraganaLoading() => const HiraganaLoadingIndicator(),
        HiraganaInput() => const HiraganaInputForm(),
        HiraganaData(sentence: final sentence) => HiraganaConvertResult(sentence: sentence),
      },
    );
  }
}


/* Loading state */
class HiraganaLoadingIndicator extends StatelessWidget {
  const HiraganaLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/* Result state */
class HiraganaConvertResult extends ConsumerWidget {
  const HiraganaConvertResult({
    super.key,
    required this.sentence,
  });

  final String sentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    final notifier = ref.watch(hiraganaNotifierProvider.notifier);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(sentence),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: notifier.reset,
              child: const Text ('再入力'),
          ),
        ],
      ),
    );
  }
}


/* Input State */
class HiraganaInputForm extends ConsumerStatefulWidget {
  const HiraganaInputForm({super.key});

  @override
  ConsumerState<HiraganaInputForm> createState() => HiraganaInputFormState();
}


class HiraganaInputFormState extends ConsumerState<HiraganaInputForm> {
  final formKey = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: textEditingController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "文章を入力してください",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "文章が入力されていません";
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () async {
            final formState = formKey.currentState!;
            if (!formState.validate()) {
              return;
            }

            final sentence = textEditingController.text;
            // 変換WebAPIの呼び出し
            await ref.read(hiraganaNotifierProvider.notifier).convert(sentence);
          },
              child: const Text('変換'),
          ),
        ],
      ),
    );
  }
}


