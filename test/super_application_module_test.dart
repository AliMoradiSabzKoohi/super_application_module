import 'package:flutter_test/flutter_test.dart';
import 'package:super_application_module/super_application_module.dart';
import 'package:super_application_module/super_application_module_platform_interface.dart';
import 'package:super_application_module/super_application_module_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSuperApplicationModulePlatform
    with MockPlatformInterfaceMixin
    implements SuperApplicationModulePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SuperApplicationModulePlatform initialPlatform = SuperApplicationModulePlatform.instance;

  test('$MethodChannelSuperApplicationModule is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSuperApplicationModule>());
  });

  test('getPlatformVersion', () async {
    SuperApplicationModule superApplicationModulePlugin = SuperApplicationModule();
    MockSuperApplicationModulePlatform fakePlatform = MockSuperApplicationModulePlatform();
    SuperApplicationModulePlatform.instance = fakePlatform;

    expect(await superApplicationModulePlugin.getPlatformVersion(), '42');
  });
}
