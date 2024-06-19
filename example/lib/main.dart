import 'package:flutter/material.dart';
import 'dart:async';

import 'package:simple_gamepads/simple_gamepads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';
  // final _simpleGamepadsPlugin = SimpleGamepads();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await _simpleGamepadsPlugin.getPlatformVersion() ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<Null>(
            stream: Stream.periodic(const Duration(milliseconds: 30)),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text('Now: ${DateTime.now()}\n'),
                  FutureBuilder(
                    future: getAvailableGamepadIds(),
                    builder: (context, snapshot) => Text(
                      'Number of gamepads: ${snapshot.data}\n',
                    ),
                  ),
                  for (int i = 0; i < 4; i++) Text('Axis $i: ${getGamepadAxis(0, i)}\n'),
                  for (int i = 0; i < 16; i++) Text('Button $i: ${getGamepadButton(0, i)}\n'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
