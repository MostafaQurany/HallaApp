import "package:flutter/material.dart";
import "package:pinput/pinput.dart";
import "package:smart_auth/smart_auth.dart";

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() => smartAuth.removeSmsListener();

  @override
  Future<String?> getSmsCode() async {
    final String? signature = await smartAuth.getAppSignature();
    debugPrint("App Signature: $signature");
    final SmsCodeResult res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}
