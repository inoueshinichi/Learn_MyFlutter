import 'package:flutter/material.dart';


class UIInputPage extends StatefulWidget {
  const UIInputPage({super.key});

  @override
  State<UIInputPage> createState() => UIInputPageState();
}


class UIInputPageState extends State<UIInputPage> {
  static var message = 'ok.';
  static var checked = false;
  static var selected = 'A';
  static var dropDownSelected = 'One';
  static var popupMenuSelected = '4';
  static var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Components'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Checkbox
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Checkbox(
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked = value!;
                        message = value ? 'checked' : 'not checked...';
                      });
                    },
                  ),
                  Text(
                    "Checkbox",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
            // Switch
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Switch(
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked = value!;
                        message = value ? 'checked' : 'not checked...';
                      });
                    },
                  ),
                  Text(
                    "Switch",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
            // Radio
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Radio<String>(
                        value: 'A',
                        groupValue: selected,
                        onChanged: (String? value) {
                          setState(() {
                            selected = value ?? 'nodata';
                            message = 'select: $selected';
                          });
                        },
                      ),
                      Text(
                        "A",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Radio<String>(
                        value: 'B',
                        groupValue: selected,
                        onChanged: (String? value) {
                          setState(() {
                            selected = value ?? 'nodata';
                            message = 'select: $selected';
                          });
                        },
                      ),
                      Text(
                        "B",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            // DropdownButton
            DropdownButton<String>(
              onChanged: (String? value) {
                setState(() {
                  dropDownSelected = value ?? 'no selected...';
                  message = 'select: $dropDownSelected';
                });
              },
              value: dropDownSelected,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
              items: <DropdownMenuItem<String>>[
                const DropdownMenuItem<String>(
                  value: 'One',
                  child: const Text('One'),
                ),
                const DropdownMenuItem<String>(
                  value: 'Two',
                  child: const Text('Two'),
                ),
                const DropdownMenuItem<String>(
                  value: 'Three',
                  child: const Text('Three'),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            // PopupMenuButton
            Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                onSelected: (String? value) {
                  setState(() {
                    popupMenuSelected = value ?? 'infinity';
                    message = 'select: $popupMenuSelected';
                  });
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      child: const Text('4'),
                      value: '4',
                    ),
                    const PopupMenuItem(
                      child: const Text('5'),
                      value: '5',
                    ),
                    const PopupMenuItem(
                      child: const Text('6'),
                      value: '6',
                    ),
                  ];
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Slider(
              onChanged: (double value) {
                setState(() {
                  sliderValue = value.floorToDouble();
                  message = 'set value: $sliderValue';
                });
              },
              min: 0.0,
              max: 100.0,
              divisions: 10,
              value: sliderValue,
            ),
          ],
        ),
      ),
    );
  }
}