import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UITextPage extends StatefulWidget {
  const UITextPage({super.key});

  @override
  UITextPageState createState() => UITextPageState();
}


class UITextPageState extends State<UITextPage> {
  String name = "tiny tank";
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    // styleプロパティは, TextStyleクラスを使用するのではなく,
    // TextThemeクラスを使うと一貫性がでる.
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    // final titleStyle = textTheme.title.copyWith(color: theme.backgroundColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Collection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Textウィジェット
            Text('Hello, $name! How are you?',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 100,
              height: 50,
            ),
            // RichTextウィジェット
            const Text.rich(TextSpan(
              text: 'Hello',
              children: <TextSpan>[
                TextSpan(
                  text: ' beautiful',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(
                  text: ' world',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]
            ),
            ),
            // strutStyleプロパティ: 文字の高さや上下文字列とのpadding設定
            const Text(
              'strutStyleプロパティ: 文字の高さや上下文字列とのpadding設定',
              strutStyle: StrutStyle(
                leading: 3.0,
                height: 1.0,
              ),
            ),
            // textAlignプロパティ: 水平方向のアライメント
            const Text(
              "textAlignプロパティ: 水平方向のアライメント",
              textAlign: TextAlign.right,
            ),
            // softWrapプロパティとoverflowプロパティによる親ウィジェットから
            // はみ出す文字列の折返し処理
            const Text(
              "softWrapプロパティとoverflowプロパティによる親ウィジェットからはみ出す文字列の折返し処理",
              softWrap: false,
              // overflow: TextOverflow.clip,
              // overflow: TextOverflow.fade,
              overflow: TextOverflow.ellipsis,
              // overflow: TextOverflow.visible,
            ),
            // maxLinesプロパティ: 行数を指定する
            const Text(
              "あいうえお.かきくけこ.さしすせそ.たちつてと.なにぬねの.はひふへほ.",
              maxLines: 3,
            ),
            // textWidthBasicプロパティ: 1行以上のテキストの幅を決める方法を指定する
            // 基本的にTextWidthBasic.longestLineを使用するときに使う.
            const Text(
              "チャットの投稿内容",
              textWidthBasis: TextWidthBasis.longestLine,
            ),
            // DefaultTextStyleウィジェット: 配下のTextウィジェットのスタイルを
            // 一括設定できる
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('A'),
                  Text('B'),
                  Text('C'),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}