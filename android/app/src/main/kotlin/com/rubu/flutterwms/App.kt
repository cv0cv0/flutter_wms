package com.rubu.flutterwms

import android.content.Context
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {

    companion object {
        lateinit var context: App
            private set
    }

    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        context=this
    }
}