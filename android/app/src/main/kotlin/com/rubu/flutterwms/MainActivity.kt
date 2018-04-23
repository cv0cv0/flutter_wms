package com.rubu.flutterwms

import android.os.Bundle
import com.rubu.flutterwms.ext.is_login
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val channel = "wms.rubu.com/channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "is_login" -> result.success(is_login)
                else -> result.notImplemented()
            }
        }
    }
}
