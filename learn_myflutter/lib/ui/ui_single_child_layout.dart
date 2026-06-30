import 'package:flutter/material.dart';
import 'dart:math' as math;

class UISingleChildLayoutPage extends StatelessWidget {
  const UISingleChildLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildLayoutView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // No.1
            Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxHeight: 100),
              child: Container(
                color: Colors.green,
                width: 300,
                height: 300,
                transform: Matrix4.rotationZ(math.pi / 6), // 30度回転
                child: Text('No.1: transform: Matrix4.rotationZ(math.pi / 6)')
              ),
            ),
            // No.2
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.deepOrangeAccent,
              width: 200,
              height: 200,
              child: Container(
                margin: EdgeInsets.all(10.0),
                color: Colors.black,
                child: Text('No.2: padding & margin', style: TextStyle(color: Colors.grey)),
              ),
            ),
            // No.3
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
                // borderRadius: BorderRadius.circular(100),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                  width: 5.0,
                  color: Colors.redAccent,
                )
              ),
              width: 100,
              height: 100,
              child: Text('No.3: BorderRadius.all(Radius.circular(100))'),
            ),
            // No.4
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Text('No.4: BoxShape.circle')
            ),
            // No.5
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                boxShadow: [
                  BoxShadow(blurRadius: 10),
                ],
              ),
              child: const Text('No.5: BoxShadow'),
            ),
            // No.6
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.yellowAccent, Colors.black],
                ),
              ),
              child: Text('No.6: LinearGradient',
                  style: TextStyle(color: Colors.purple)
              ),
            ),
            // No.7
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors:[Colors.green, Colors.red],
                  stops: [0.4, 1.0],
                ),
              ),
              child: Text('No.7: RadialGradient'),
            ),
            // No.8
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                gradient: SweepGradient(
                  colors: [Colors.green, Colors.red, Colors.black],
                  stops: [0.1, 0.7, 0.9],
                ),
              ),
              child: Text('No.8: SweepGradient',
                  style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // No.9
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://ssb88.tiny-tank.jp/static/base/image/SSB88_LOGO_SMALL.jpg',
                    ),
                    fit: BoxFit.fitWidth
                ),
              ),
              child: Text('No.9: DecorationImage, NetworkImage',
                  style: TextStyle(color: Colors.amberAccent),
              ),
            ),
            // No.10
            const SizedBox(
              width: 200,
              height: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('No.10: SizedBox'),
              ),
            ),
            // No.11
            const Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 200,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Text('No.11 Align(Alignment.bottomLeft'),
                ),
              ),
            ),
            // No.12
            const Align(
              alignment: Alignment(-1.0, -1.0), // 左上 (中央(0,0))
              child: SizedBox(
                width: 250,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  ),
                  child: Text('No.12 Alignment(-1.0,-1.0)'),
                ),
              ),
            ),
            // No.13
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5.0,
                  color: Colors.black38,
                ),
              ),
              child: const Align(
                alignment: Alignment.center,
                // 子サイズを親サイズいっぱいに広げて表示する
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  heightFactor: 1.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent
                    ),
                    child: Text('No.13 FractionallySizedBox'),
                  ),
                ),
              ),
            ),
            // No.14
            const SizedBox(
              width: 300,
              height: 300,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.pink
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: DecoratedBox(
                        decoration:BoxDecoration(
                          color: Colors.purple,
                        ),
                        child: Text(
                            'No.14 Padding',
                            style: TextStyle(color: Colors.white54)
                        ),
                      ),
                  ),
              ),
            ),
            // No.15
            ConstrainedBox(
              // childプロパティで指定したウィジェットに制約を追加できる.
              // BoxConstraintsクラスで制約を指定する.
              constraints: const BoxConstraints(maxHeight: 100, maxWidth: 200),
              child: SizedBox(
                width: 300,
                height: 300,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                  child: Text('No.15 ConstrainedBox'),
                ),
              ),
            ),
            // No.16
            ConstrainedBox(
              // childプロパティで指定したウィジェットに制約を追加できる.
              // BoxConstraintsクラスで制約を指定する.
              // 親領域で目一杯広げる。ただし、指定方向はmaxが指定値になる.
              constraints: const BoxConstraints.expand(
                height: 100,
              ),
              child: SizedBox(
                width: 300,
                height: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Text('No.16 ConstrainedBox.expand()'),
                ),
              ),
            ),
            // No.17
            ConstrainedBox(
              // childプロパティで指定したウィジェットに制約を追加できる.
              // BoxConstraintsクラスで制約を指定する.
              // 広げる最大値を指定
              constraints: BoxConstraints.loose(
                Size(/*width*/100, /*height*/100),
              ), // = BoxConstraints(maxWidth: 100, maxHeight: 100)
              child: SizedBox(
                width: 300,
                height: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Text('No.17 ConstrainedBox.loose()'),
                ),
              ),
            ),
            // No.18
            ConstrainedBox(
              // childプロパティで指定したウィジェットに制約を追加できる.
              // BoxConstraintsクラスで制約を指定する.
              // 固定値でサイズ固定
              constraints: BoxConstraints.tight(
                Size(/*width*/200, /*height*/200),
              ),
              child: SizedBox(
                width: 300,
                height: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Text('No.18 ConstrainedBox.tight()'),
                ),
              ),
            ),
            // No.19
            Container(
              width: 400,
              height: 300,
              color: Colors.grey,
              child: FittedBox(
                alignment: Alignment.centerRight,
                fit: BoxFit.fitHeight,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width:1.0),
                      color: Colors.blue,
                    ),
                    child: Text('No.19 FittedBox'),
                  ),
                ),
              ),
            ),
            // No.21
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.red),
                image: DecorationImage(
                  image: NetworkImage('https://ssb88.tiny-tank.jp/static/base/image/SSB88_LOGO_SMALL.jpg'),
                ),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Text('No.21 AspectRatio'),
                ),
              ),
            ),
            // No.21
            // ListView(
            //   children: [
            //     const Text('No.21 ListView & LimitedBox'),
            //     for (int seed in Iterable<int>.generate(5).toList())
            //       LimitedBox(
            //         maxHeight: 30,
            //         child: Container(
            //           color: Color.fromARGB(
            //             math.Random(seed).nextInt(256),
            //             math.Random(seed).nextInt(256),
            //             math.Random(seed).nextInt(256),
            //             math.Random(seed).nextInt(256),
            //           ),
            //         ),
            //       ),
            //   ],
            // ),
            // No.23
            Text('No.32 Spacer'),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const Spacer(flex: 1),
                  for (var _ in Iterable<int>.generate(5).toList())
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        color: Color.fromARGB(
                          math.Random().nextInt(256),
                          math.Random().nextInt(256),
                          math.Random().nextInt(256),
                          math.Random().nextInt(256),
                        ),
                      ),
                    ),
                  const Spacer(),
                ],
              ),
            ),
            // No.24
            Text('No.24 LayoutBuilder'),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxHeight < 100) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.green,
                  );
                } else {
                  return Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  );
                }
              }
            ),
          ]),
        ),
    );
  }
}