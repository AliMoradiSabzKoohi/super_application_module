import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'super_application_module_method_channel.dart';

abstract class SuperApplicationModulePlatform extends PlatformInterface {
  /// Constructs a SuperApplicationModulePlatform.
  SuperApplicationModulePlatform() : super(token: _token);

  static final Object _token = Object();

  static SuperApplicationModulePlatform _instance = MethodChannelSuperApplicationModule();

  /// The default instance of [SuperApplicationModulePlatform] to use.
  ///
  /// Defaults to [MethodChannelSuperApplicationModule].
  static SuperApplicationModulePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SuperApplicationModulePlatform] when
  /// they register themselves.
  static set instance(SuperApplicationModulePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
