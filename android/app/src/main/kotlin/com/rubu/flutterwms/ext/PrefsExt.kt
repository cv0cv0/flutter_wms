package com.rubu.flutterwms.ext

import android.content.Context
import com.rubu.flutterwms.App

/**
 * Created by GR on 2017/11/14.
 */
private val prefs = App.context.getSharedPreferences("data", Context.MODE_PRIVATE)

private val editor = prefs.edit()

var is_login: Boolean
    get() = prefs.getBoolean("is_login", false)
    set(value) {
        editor.putBoolean("is_login", value)
        editor.apply()
    }

var staff_no: String
    get() = prefs.getString("staff_no", "")
    set(value) {
        editor.putString("staff_no", value)
        editor.apply()
    }

var staff_id: Long
    get() = prefs.getLong("staff_id", 0)
    set(value) {
        editor.putLong("staff_id", value)
        editor.apply()
    }

var staff_name: String
    get() = prefs.getString("staff_name", "")
    set(value) {
        editor.putString("staff_name", value)
        editor.apply()
    }
