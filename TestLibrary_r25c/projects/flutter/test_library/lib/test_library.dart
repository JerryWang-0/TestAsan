
import 'test_library_platform_interface.dart';

class TestLibrary {
  Future<String?> getPlatformVersion() {
    return TestLibraryPlatform.instance.getPlatformVersion();
  }
}
