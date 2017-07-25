package com.boldit.apptentive;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import com.apptentive.android.sdk.Apptentive;

public class RNApptentiveModule extends ReactContextBaseJavaModule {

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
}
