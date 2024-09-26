import 'package:flutter_test/flutter_test.dart';
import 'package:test_library/test_library.dart';
import 'package:test_library/test_library_platform_interface.dart';
import 'package:test_library/test_library_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTestLibraryPlatform
    with MockPlatformInterfaceMixin
    implements TestLibraryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TestLibraryPlatform initialPlatform = TestLibraryPlatform.instance;

  test('$MethodChannelTestLibrary is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTestLibrary>());
  });

  test('getPlatformVersion', () async {
    TestLibrary testLibraryPlugin = TestLibrary();
    MockTestLibraryPlatform fakePlatform = MockTestLibraryPlatform();
    TestLibraryPlatform.instance = fakePlatform;

    expect(await testLibraryPlugin.getPlatformVersion(), '42');
  });
}
