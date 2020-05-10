package com.example.wear_example

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

import android.support.wear.ambient.AmbientMode

class MainActivity: FlutterActivity(), AmbientMode.AmbientCallbackProvider {
    private var mAmbientController: AmbientMode.AmbientController? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        mAmbientController = AmbientMode.attachAmbientSupport(this)
    }

    override fun getAmbientCallback(): AmbientMode.AmbientCallback {
        return FlutterAmbientCallback(flutterView)
    }

    private fun setShapeMethodChannel() {
        MethodChannel(flutterView, shapeChannel).setMethodCallHandler { _, result ->
            setOnApplyWindowInsetsListener(flutterView, {_, insets: WindowInsetsCompat? ->
            if (insets?.isRound == true) {
                result.success(0)
            }
            else {
                result.success(1)
            }
            WindowInsetsCompat(insets)
        })
        requestApplyInsets(flutterView)
    }
}

}


private class FlutterAmbientCallback(val flutterView: FlutterView): AmbientMode.AmbientCallback() {
    override fun onEnterAmbient(ambientDetails: Bundle) {
        MethodChannel(flutterView, ambientChannel).invokeMethod("enter", null)
        super.onEnterAmbient(ambientDetails)
    }
    
    override fun onExitAmbient() {
        MethodChannel(flutterView, ambientChannel).invokeMethod("exit", null)
        super.onExitAmbient()
    }
    
    override fun onUpdateAmbient() {
        MethodChannel(flutterView, ambientChannel).invokeMethod("update", null)
        super.onUpdateAmbient()
    }
}