import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'test_library_method_channel.dart';

abstract class TestLibraryPlatform extends PlatformInterface {
  /// Constructs a TestLibraryPlatform.
  TestLibraryPlatform() : super(token: _token);

  static final Object _token = Object();

  static TestLibraryPlatform _instance = MethodChannelTestLibrary();

  /// The default instance of [TestLibraryPlatform] to use.
  ///
  /// Defaults to [MethodChannelTestLibrary].
  static TestLibraryPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TestLibraryPlatform] when
  /// they register themselves.
  static set instance(TestLibraryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
