// import 'dart:async';

// import 'package:gamepads/gamepads.dart';
// import 'package:flutter/foundation.dart';

// import 'package:flutter/material.dart';

// class _MyWinGamepad {
//   static const Map<String, int> sticMap = {
//     'dwXpos': 0,
//     'dwYpos': 1,
//     'dwZpos': 2,
//     'dwRpos': 3,
//     'dwUpos': 4,
//     'dwVpos': 5,
//     'pov': 6,
//   };

//   final Map<int, double> analogNewestValues = {};
//   final Map<int, double> buttonNewestValues = {};

//   final String id;
//   StreamSubscription<GamepadEvent>? subscription;

//   _MyWinGamepad(this.id);

//   void initialize() {
//     subscription = Gamepads.eventsByGamepad(id).listen((e) {
//       switch (e.type) {
//         case KeyType.analog:
//           analogNewestValues[sticMap[e.key]!] = e.value / 32767.0 - 1.0;
//           break;
//         case KeyType.button:
//           final int keyIndex = int.parse(e.key.substring(7));
//           buttonNewestValues[keyIndex] = e.value;
//           break;
//         default:
//           break;
//       }
//     });
//     debugPrint("Gamepad '$id' initialized");
//   }

//   void dispose() {
//     subscription?.cancel();
//   }
// }

// final Map<String, _MyWinGamepad> _gamepads = {};

// Future<List<String>> getAvailableGamepadIds() async {
//   final List<GamepadController> gamepads = await Gamepads.list();
//   debugPrint(gamepads.toString());
//   return gamepads
//       .map(
//         (controller) => controller.id,
//       )
//       .toList();
// }

// _MyWinGamepad _initializeGamepad(int gamepadNumber) {
//   final _MyWinGamepad gamepad = _MyWinGamepad("$gamepadNumber");
//   gamepad.initialize();
//   _gamepads["$gamepadNumber"] = gamepad;
//   return gamepad;
// }

// _MyWinGamepad _initializedGamepad(int gamepadNumber) {
//   if (!_gamepads.containsKey("$gamepadNumber")) {
//     _initializeGamepad(gamepadNumber);
//   }
//   return _gamepads["$gamepadNumber"]!;
// }

// double? getGamepadAxis(int gamepadNumber, int index) {
//   final _MyWinGamepad gamepad = _initializedGamepad(gamepadNumber);
//   return gamepad.analogNewestValues[index];
// }

// bool getGamepadButton(int gamepadNumber, int index) {
//   final _MyWinGamepad gamepad = _initializedGamepad(gamepadNumber);
//   return gamepad.buttonNewestValues[index] == 1;
// }

// void disposeGamepad(int gamepadNumber) {
//   final _MyWinGamepad? gamepad = _gamepads["$gamepadNumber"];
//   gamepad?.dispose();
//   _gamepads.remove("$gamepadNumber");
// }
