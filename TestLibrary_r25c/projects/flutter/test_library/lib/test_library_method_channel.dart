import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_library_platform_interface.dart';

/// An implementation of [TestLibraryPlatform] that uses method channels.
class MethodChannelTestLibrary extends TestLibraryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_library');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
