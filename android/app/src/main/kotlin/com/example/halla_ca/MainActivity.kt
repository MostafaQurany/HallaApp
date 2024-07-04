package com.example.halla_ca

import io.flutter.embedding.android.FlutterActivity


import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.net.wifi.WifiInfo
import android.net.wifi.WifiManager
import android.nfc.NfcAdapter
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.provider.Settings


class MainActivity: FlutterActivity(){
    private val CHANNEL = "Back_End_Channel"
    private lateinit var methodChannel: MethodChannel
     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "getIfNFCIsAvailable") {
                val ifNFCIsAvailable = getIfNFCIsAvailable()
                result.success(ifNFCIsAvailable)
            }
            else {
                result.notImplemented()
            }
        }
    }
       private fun getIfNFCIsAvailable(): Boolean {

        val nfcAdapter = NfcAdapter.getDefaultAdapter(this)

        return nfcAdapter != null
    }
}
