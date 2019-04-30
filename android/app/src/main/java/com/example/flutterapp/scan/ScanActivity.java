package com.example.flutterapp.scan;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.example.flutterapp.R;


public class ScanActivity extends Activity {
	
    private int scanmode = -1;
    private boolean bleft = false, bright = false, bsound = false;

    private String m_Broadcastname;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		ScanSetting();
        setContentView(R.layout.scan_activity);
		Intent intent = new Intent();
        intent.setAction("com.barcode.sendBroadcastScan");
        sendBroadcast(intent);
    }
	
	private void ScanSetting() {
        // 0 : fast; 1 : slow; 2 : broadcast
        String version = android.os.Build.VERSION.RELEASE;
        if (version.equals("4.2.2")) {
            scanmode = SysBarcodeUtil.getBarcodeSendMode(ScanActivity.this);
            bleft = SysBarcodeUtil.getLeftSwitchState(ScanActivity.this);
            bright = SysBarcodeUtil.getRightSwitchState(ScanActivity.this);
            if (!bleft) {
                SysBarcodeUtil.setLeftSwitchState(ScanActivity.this, true);
            }
            if (!bright) {
                SysBarcodeUtil.setRightSwitchState(ScanActivity.this, true);
            }
            if (scanmode != 2) {
                SysBarcodeUtil.setBarcodeSendMode(ScanActivity.this, 2);
            }
        } else {
            scanmode = ScanHelper.getBarcodeReceiveModel(ScanActivity.this);
            bleft = ScanHelper.getScanSwitchLeft(ScanActivity.this);
            bright = ScanHelper.getScanSwitchRight(ScanActivity.this);
            bsound = ScanHelper.getScanSound(ScanActivity.this);
            if (!bsound) {
                ScanHelper.setScanSound(ScanActivity.this, true);
            }
            if (!bleft) {
                ScanHelper.setScanSwitchLeft(ScanActivity.this, true);
            }
            if (!bright) {
                ScanHelper.setScanSwitchRight(ScanActivity.this, true);
            }
            if (scanmode != 2)
                ScanHelper.setBarcodeReceiveModel(ScanActivity.this, 2);
        }
    }
    
    
    @Override
    protected void onDestroy() {
        super.onDestroy();
        String version = android.os.Build.VERSION.RELEASE;
        SysBarcodeUtil.setLeftSwitchState(ScanActivity.this, bleft);
        SysBarcodeUtil.setRightSwitchState(ScanActivity.this, bright);
        SysBarcodeUtil.setBarcodeSendMode(ScanActivity.this, scanmode);
    }

    public void backBarcode(String barcode) {
        Intent data = getIntent();
        final boolean needResult = data.getBooleanExtra("needResult", false);
        if (needResult) {
            Intent resultData = new Intent();
            JSONObject json = new JSONObject();
            try {
            	json.put("status", true);
                json.put("content", barcode);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            resultData.putExtra("result", json.toString());
            resultData.putExtra("status", true);
            setResult(RESULT_OK, resultData);
        }
        finish();
    }

    public void backMsg() {
        Intent data = getIntent();
        final boolean needResult = data.getBooleanExtra("needResult", false);
        if (needResult) {
            Intent resultData = new Intent();
            JSONObject json = new JSONObject();
            try {
                json.put("msg", "未扫描到结果，请重新扫描");
            } catch (JSONException e) {
                e.printStackTrace();
            }
            resultData.putExtra("msg", json.toString());
            resultData.putExtra("status", false);
            setResult(RESULT_OK, resultData);
        }
        finish();
    }

    //点击触发扫码（左右键）接收广播
    BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context arg0, Intent arg1) {
            if (arg1.getAction().equals(m_Broadcastname)) {
                String str = arg1.getStringExtra("BARCODE");
                if (str.equals("")) {
                	backMsg();
                } else {
                    backBarcode(str);
                }
            }
        }
    };

    //注册广播
    @Override
    protected void onResume() {
        super.onResume();
        final IntentFilter intentFilter = new IntentFilter();
        m_Broadcastname = "com.barcode.sendBroadcast";// com.barcode.sendBroadcastScan
        intentFilter.addAction(m_Broadcastname);
        registerReceiver(receiver, intentFilter);
    }

    //销毁广播
    @Override
    protected void onPause() {
        super.onPause();
        unregisterReceiver(receiver);
    }
}
