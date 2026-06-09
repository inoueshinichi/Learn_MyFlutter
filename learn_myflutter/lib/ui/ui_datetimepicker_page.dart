import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class UIDatetimePickerPage extends StatefulWidget {
  const UIDatetimePickerPage({super.key});

  @override
  State<UIDatetimePickerPage> createState() => UIDatetimePickerPageState();
}


class UIDatetimePickerPageState extends State<UIDatetimePickerPage> {
  DateTime? datetime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTime Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(datetime.toString(), style: TextStyle(fontSize: 24)),
            Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16)),
            IconButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1990, 1, 1),
                    maxTime: DateTime(2049, 12, 31),
                    onConfirm: (DateTime date) {
                      setState(() {
                        datetime = date;
                      });
                    },
                    currentTime: DateTime.now(), locale: LocaleType.jp
                );
              },
              icon: Icon(Icons.date_range_sharp),
            ),
          ],
        ),
      ),
    );
  }
}