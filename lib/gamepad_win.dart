import 'dart:async';

import 'package:win32_gamepad/win32_gamepad.dart' as win32_gamepad;

List<win32_gamepad.Gamepad> getDartGamepadList() {
  final List<win32_gamepad.Gamepad> ret = [];
  int controller = 0;
  while (true) {
    final g = win32_gamepad.Gamepad(controller);
    if (g.isConnected) {
      ret.add(g);
    } else {
      break;
    }
    controller++;
  }
  return ret;
}

Future<List<String>> getAvailableGamepadIds() async {
  return getDartGamepadList().map((gamepad) => gamepad.controller.toString()).toList();
}

double? getGamepadAxis(int gamepadIndex, int axesIndex) {
  final win32_gamepad.Gamepad g = win32_gamepad.Gamepad(gamepadIndex);

  final int? rawValue = (switch (axesIndex) {
    0 => g.state.leftThumbstickX,
    1 => g.state.leftThumbstickY,
    2 => g.state.rightThumbstickX,
    3 => g.state.rightThumbstickY,
    4 => g.state.leftTrigger,
    5 => g.state.rightTrigger,
    _ => null,
  });
  if (rawValue == null) {
    return null;
  }
  const int min = -32768;
  const int max = 32767;
  if (axesIndex < 4) {
    return (rawValue - min) / (max - min) * 2 - 1;
  } else {
    return rawValue / max;
  }
}

bool getGamepadButton(int gamepadIndex, int buttonIndex) {
  final win32_gamepad.Gamepad g = win32_gamepad.Gamepad(gamepadIndex);

  return switch (buttonIndex) {
    0 => g.state.buttonA,
    1 => g.state.buttonB,
    2 => g.state.buttonX,
    3 => g.state.buttonY,
    4 => g.state.leftShoulder,
    5 => g.state.rightShoulder,
    6 => g.state.leftThumb,
    7 => g.state.rightThumb,
    8 => g.state.buttonBack,
    9 => g.state.buttonStart,
    10 => g.state.dpadUp,
    11 => g.state.dpadDown,
    12 => g.state.dpadLeft,
    13 => g.state.dpadRight,
    _ => false,
  };
}

void disposeGamepad(String gamepadId) {}
