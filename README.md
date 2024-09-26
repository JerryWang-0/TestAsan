# Native code enable ASAN and run in flutter demo

## Environment
- Host: macOS14.5 (23F79) Apple M1
- flutter: 3.22.3

## Some descriptions
- TestLibraryRoot:
    - NDK r21e: ./TestLibrary_r21e
    - NDK r25c: ./TestLibrary_r25c
- AndroidLibraryProjectRoot: TestLibraryRoot/projects/Android
- FlutterDemoRoot: TestLibraryRoot/projects/flutter/test_library/example


## Build apk steps
1. Use AndroidStudio open AndroidLibraryProject
2. Sync Project with gradle files
3. Ensure :app:TestLibrary use release Build Variant
4. Build -> Make Module 'Test.app.TestLibrary'
5. cd to 'FlutterDemoRoot', execute commond 'flutter build apk --release -PENABLE_ASAN=true'
6. .apk will be generated to 'FlutterDemoRoot/build/app/outputs/apk'