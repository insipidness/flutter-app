package com.example.flutterapp;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;
import android.util.Log;

public class FlutterPluginEventTest  implements EventChannel.StreamHandler {
    private static final String TAG = "FlutterPluginEventTest";
    public static String CHANNEL = "com.mmd.flutterapp/plugin";

    static EventChannel channel;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new EventChannel(registrar.messenger(), CHANNEL);
        FlutterPluginEventTest flutterPluginEventTest = new FlutterPluginEventTest();
        channel.setStreamHandler(flutterPluginEventTest);
    }

    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        Thread.sleep(1000);
                        eventSink.success(System.currentTimeMillis());
                    } catch (InterruptedException e) {
                        eventSink.error("error","error",e.getMessage());
                    }
                }
            }
        }).start();

    }

    @Override
    public void onCancel(Object o) {
        Log.i(TAG, "onCancel: "+o);
    }
}
