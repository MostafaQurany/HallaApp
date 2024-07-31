package com.example.halla_ca


import android.nfc.NfcAdapter
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(){
    private val channal = "Back_End_Channel"
    private lateinit var methodChannel: MethodChannel
     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channal)
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "getIfNFCIsAvailable" -> {
                    val ifNFCIsAvailable = getIfNFCIsAvailable()
                    result.success(ifNFCIsAvailable)
                }
                "getMacAddress" -> {
                    val macAddress = getSerialNumber()
                    result.success(macAddress)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
    private fun getIfNFCIsAvailable(): Boolean {

        val nfcAdapter = NfcAdapter.getDefaultAdapter(this)

        return nfcAdapter != null
    
    }
    
    private fun getSerialNumber(): String {
        val mId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
        return  mId
    }
}
