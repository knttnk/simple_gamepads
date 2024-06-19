import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simple_gamepads_platform_interface.dart';

/// An implementation of [SimpleGamepadsPlatform] that uses method channels.
class MethodChannelSimpleGamepads extends SimpleGamepadsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simple_gamepads');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
