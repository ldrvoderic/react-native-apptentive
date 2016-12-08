package com.inkitt.aptentive;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import com.apptentive.android.sdk.Apptentive;

import java.util.Iterator;

public class RNApptentiveModule extends ReactContextBaseJavaModule {
    private final static String TAG = RNApptentiveModule.class.getCanonicalName();

    public RNApptentiveModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RNApptentive";
    }

    @ReactMethod
    public void engage(String eventName) {
        Apptentive.engage(getReactApplicationContext(), eventName);
    }

//    @Override
//    public void onCreate() {
//      super.onCreate();
//      Apptentive.register(this, "YOUR_APPTENTIVE_API_KEY");
//    }

}
