cmake_minimum_required(VERSION 3.10)

project(TestLibrary)
set(LIB_NAME TestLibrary)

message("CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")

if(ASAN)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")
    set(CMAKE_LINKER_FLAGS "${CMAKE_LINKER_FLAGS} -fsanitize=address")
endif()

add_library(${LIB_NAME} SHARED TestLibrary.cpp)

set_target_properties(${LIB_NAME} PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${BINARY_DIR})

if(ASAN)
    # NDK r21e
    set(LIBCPP_SHARED_SO ${ANDROID_NDK}/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so)
    message("LIBCPP_SHARED_SO:${LIBCPP_SHARED_SO}")
    configure_file(${LIBCPP_SHARED_SO} ${BINARY_DIR}/libc++_shared.so COPYONLY)

    set(LIBASAN_SO ${ANDROID_NDK}/toolchains/llvm/prebuilt/darwin-x86_64/lib64/clang/9.0.9/lib/linux/libclang_rt.asan-aarch64-android.so)
    message("LIBASAN_SO:${LIBASAN_SO}")
    configure_file(${LIBASAN_SO} ${BINARY_DIR}/libclang_rt.asan-aarch64-android.so COPYONLY)

    # NDK r25c
    # set(LIBCPP_SHARED_SO ${ANDROID_NDK}/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so)
    # message("LIBCPP_SHARED_SO:${LIBCPP_SHARED_SO}")
    # configure_file(${LIBCPP_SHARED_SO} ${BINARY_DIR}/libc++_shared.so COPYONLY)

    # set(LIBASAN_SO ${ANDROID_NDK}/toolchains/llvm/prebuilt/darwin-x86_64/lib64/clang/14.0.7/lib/linux/libclang_rt.asan-aarch64-android.so)
    # message("LIBASAN_SO:${LIBASAN_SO}")
    # configure_file(${LIBASAN_SO} ${BINARY_DIR}/libclang_rt.asan-aarch64-android.so COPYONLY)

endif()