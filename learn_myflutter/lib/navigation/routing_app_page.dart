import 'package:flutter/material.dart';
import 'page_routes.dart';

class NavRoutingAppPage extends StatelessWidget {
  const NavRoutingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder> {
        PageRoutes.firstPage: (context) => const NavRoutingFirstPage(),
        PageRoutes.secondPage: (context) => const NavRoutingSecondPage(),
        PageRoutes.thirdPage: (context) => const NavRoutingThirdPage(),
        PageRoutes.fouthPage: (context) => const NavRoutingForthPage(),
      },
      home: const NavRoutingFirstPage(),
    );
  }
}


class NavRoutingFirstPage extends StatelessWidget {
  const NavRoutingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(PageRoutes.secondPage),
                child: const Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(PageRoutes.thirdPage),
              child: const Text('Go to Third Page'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(PageRoutes.fouthPage, arguments: 'Tiny Tank'),
              child: const Text('Go to Fourth Page'),
            ),
          ]
        )
      ),
    );
  }
}


class NavRoutingSecondPage extends StatelessWidget {
  const NavRoutingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Second Page'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Back to Previous Page'),
                ),
              ]
          )
      ),
    );
  }
}


class NavRoutingThirdPage extends StatelessWidget {
  const NavRoutingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Third Page'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(PageRoutes.firstPage),
                  child: const Text('Go to First Page'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(PageRoutes.secondPage),
                  child: const Text('Go to Second Page'),
                ),
              ]
          )
      ),
    );
  }
}


class NavRoutingForthPage extends StatelessWidget {
  const NavRoutingForthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    var text = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing Forth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text, style: TextStyle(fontSize: 40.0)),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to Previous Page')),
          ]
        )
      )
    );
  }
}