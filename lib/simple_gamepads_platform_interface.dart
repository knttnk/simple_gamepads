import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simple_gamepads_method_channel.dart';

abstract class SimpleGamepadsPlatform extends PlatformInterface {
  /// Constructs a SimpleGamepadsPlatform.
  SimpleGamepadsPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimpleGamepadsPlatform _instance = MethodChannelSimpleGamepads();

  /// The default instance of [SimpleGamepadsPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimpleGamepads].
  static SimpleGamepadsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimpleGamepadsPlatform] when
  /// they register themselves.
  static set instance(SimpleGamepadsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
