import 'package:flutter/material.dart';


class UIPageviewPage extends StatefulWidget {
  const UIPageviewPage({super.key});

  @override
  State<UIPageviewPage> createState() => UIPageviewPageState();
}


class UIPageviewPageState extends State<UIPageviewPage> {
  late PageController pageController;
  int selectedIndex = 0;

  final pages = [
    UIPageviewItemPage1(),
    UIPageviewItemPage2(),
    UIPageviewItemPage3(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: pages,
      ),
    );
  }
}

class UIPageviewItemPage1 extends StatelessWidget {
  const UIPageviewItemPage1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test1'),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: const Text(
            'Test1',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}


class UIPageviewItemPage2 extends StatelessWidget {
  const UIPageviewItemPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test2'),
      ),
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: const Text(
            'Test2',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}


class UIPageviewItemPage3 extends StatelessWidget {
  const UIPageviewItemPage3({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test3'),
      ),
      body: Center(
        child: Container(
          color: Colors.blueAccent,
          child: const Text(
            'Test3',
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}


