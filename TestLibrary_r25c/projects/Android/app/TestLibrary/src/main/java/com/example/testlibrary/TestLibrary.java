package com.example.testlibrary;

public class TestLibrary {
    static {
        try {
            System.loadLibrary("TestLibrary");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public native String stringFromJNI();
}
