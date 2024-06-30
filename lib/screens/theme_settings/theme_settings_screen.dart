import 'package:flutter/material.dart';

import '../../theme/AppTheme.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key, required this.navigatorContext});

  final BuildContext navigatorContext;

  @override
  Widget build(BuildContext context) {
    final darkTheme = AppTheme.dark();
    final lightTheme = AppTheme.light();
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MyHomePage(
        title: 'Theme Setting Demo',
        navigatorContext: navigatorContext,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.navigatorContext});

  final String title;
  final BuildContext navigatorContext;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(widget.navigatorContext).pop(true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
