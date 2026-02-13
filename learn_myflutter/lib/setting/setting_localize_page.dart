import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:learn_myflutter/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingLocalizePage extends StatelessWidget {
  const SettingLocalizePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    // Intl.defaultLocale = Localizations.localeOf(context).toString();
    // print("Intl.defaultLocale: ${Intl.defaultLocale}");
    final l10n = S.of(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('L10n'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(),
            Text(
              DateFormat.yMEd().format(DateTime.now()),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(l10n.helloWorld, style: TextStyle(fontSize: 30)),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(l10n.helloHoge('ほげー'), style: TextStyle(fontSize: 30)),
            Text(l10n.numOfSearchResult(10), style: TextStyle(fontWeight: FontWeight.w100))
          ],
        )
      )
    );
  }
}