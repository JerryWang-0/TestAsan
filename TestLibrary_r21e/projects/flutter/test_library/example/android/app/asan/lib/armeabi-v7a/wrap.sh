#!/system/bin/sh
HERE="$(cd "$(dirname "$0")" && pwd)"
export ASAN_OPTIONS=help=1,log_to_syslog=false,log_path=/sdcard/Android/data/im.zego.ExpressTestDemo/files/asan.log,detect_stack_use_after_return=1,detect_container_overflow=0,color=never,strict_init_order=true,strict_string_checks=true,quarantine_size_mb=32,redzone=64,check_initialization_order=true,detect_odr_violation=2
ASAN_LIB=$(ls $HERE/libclang_rt.asan-*-android.so)
if [ -f "$HERE/libc++_shared.so" ]; then
    # Workaround for https://github.com/android-ndk/ndk/issues/988.
    export LD_PRELOAD="$ASAN_LIB $HERE/libc++_shared.so"
else
    export LD_PRELOAD="$ASAN_LIB"
fi
"$@"
