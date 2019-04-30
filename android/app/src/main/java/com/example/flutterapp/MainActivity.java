package com.example.flutterapp;

import android.app.Activity;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.util.Log;
import android.view.inputmethod.InputMethodSession;

import com.example.flutterapp.scan.ScanActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.EventListener;
import java.util.Iterator;

public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "samples.flutter.io/battery";
  static final int ACTIVITY_REQUEST_CODE_B = 200;
  private  MethodChannel.Result _result;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, Result result) {
                if (methodCall.method.equals("getBatteryLevel")) {
                    Intent intent = new Intent(MainActivity.this, ScanActivity.class);
                    intent.putExtra("needResult", true);
                    startActivityForResult(intent, ACTIVITY_REQUEST_CODE_B);
                    _result = result;
                } else {
                  result.notImplemented();
                }
              }
            }
    );
  }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
//        Bundle bundle = data.getExtras();
//        for (String key: bundle.keySet())
//        {
//            Log.i("Bundle Content", "Key=" + key + ", content=" +bundle.getString(key));
//        }
//        super.onActivityResult(requestCode, resultCode, data);
//        _result.success("1111");
        Log.i("resultCode:",String.valueOf(resultCode));
        Log.i("requestCode:",String.valueOf(requestCode));
        if(resultCode == Activity.RESULT_OK && requestCode == ACTIVITY_REQUEST_CODE_B){
            if(data.getBooleanExtra("status", true)){
                                String result = data.getStringExtra("result");





                try {
                    JSONObject ret = new JSONObject(data.getStringExtra("result"));
                    Iterator it = ret.keys();
                    Log.i("iiiii:","1111111111111111111111111111111111111");
                    while(it.hasNext()){
                        String key = (String) it.next();
                        String value = ret.getString(key);
                        Log.i("key:",key);
                        Log.i("value",value);
                    }
                    _result.success(data.getStringExtra("result"));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }else{
                String msg = data.getStringExtra("msg");
                try {
                    JSONObject err = new JSONObject(msg);
                    _result.success("aaaa");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


