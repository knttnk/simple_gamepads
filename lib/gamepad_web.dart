import 'dart:async';
import 'dart:html' as html;

import 'package:js/js.dart';

@JS("navigator.getGamepads")
external List getGamepads();

List<html.Gamepad> getDartGamepadList() {
  final List<dynamic> gamepads = getGamepads();
  final List<html.Gamepad> result = [];
  for (final gamepadObject in gamepads.nonNulls) {
    final html.Gamepad gamepad = gamepadObject as html.Gamepad;
    result.add(gamepad);
  }
  return result;
}

Future<List<String>> getAvailableGamepadIds() async {
  return getDartGamepadList().map((gamepad) => gamepad.id ?? "Unknown").toList();
}

double? getGamepadAxis(int gamepadIndex, int axesIndex) {
  final List<html.Gamepad> gamepads = getDartGamepadList();
  if (gamepadIndex >= gamepads.length) {
    return null;
  }
  final html.Gamepad gamepad = gamepads[gamepadIndex];
  final List<num>? axes = gamepad.axes;
  if (axes == null || axesIndex >= axes.length) {
    return null;
  }
  return axes[axesIndex].toDouble();
}

bool getGamepadButton(int gamepadIndex, int buttonIndex) {
  final List<html.Gamepad> gamepads = getDartGamepadList();
  if (gamepadIndex >= gamepads.length) {
    return false;
  }
  final html.Gamepad gamepad = gamepads[gamepadIndex];
  final List<bool?>? buttons = gamepad.buttons?.map((button) => button.pressed).toList();
  if (buttons == null || buttonIndex >= buttons.length) {
    return false;
  }
  return buttons[buttonIndex] ?? false;
}

void disposeGamepad(String gamepadId) {}
