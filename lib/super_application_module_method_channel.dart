import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'super_application_module_platform_interface.dart';

/// An implementation of [SuperApplicationModulePlatform] that uses method channels.
class MethodChannelSuperApplicationModule extends SuperApplicationModulePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('super_application_module');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
