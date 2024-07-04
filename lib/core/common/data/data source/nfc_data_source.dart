import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halla/core/error/failure.dart';
import 'package:halla/core/utils/encryption.dart';
import 'package:nfc_manager/nfc_manager.dart';

enum NfcEnumState {
  success,
  fail,
  error,
}

abstract interface class NfcDataSource {
  Future<bool> getNFCIsAvailable();
  Future<bool> getNFCIsOpen();
  Future<void> writeOnNfc(String message);
}

class NfcDataSourceImpl implements NfcDataSource {
  final String channelName = 'Back_End_Channel';

  final NfcManager _nfcManager = NfcManager.instance;

  final EncryptedBackend _encryptedBackend = EncryptedBackendImpl();

  final ValueNotifier<dynamic> _result = ValueNotifier<dynamic>(null);

  ValueNotifier<dynamic> get result => _result;

  String? data;

  @override
  Future<bool> getNFCIsAvailable() async {
    final channel = MethodChannel(channelName);
    return await channel.invokeMethod<bool>('getIfNFCIsAvailable') ?? false;
  }

  @override
  Future<bool> getNFCIsOpen() async {
    return await _nfcManager.isAvailable();
  }

  @override
  Future<NfcEnumState> writeOnNfc(String message) async {
    final completer = Completer<NfcEnumState>();
    _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        _nfcManager.stopSession(errorMessage: _result.value);
        completer.completeError('Nfc is not ndef writable');
        throw Failure('Nfc is not ndef writable');
      }
      final messageEncrypted = _encryptedBackend.encrypted(message);
      final records = <NdefRecord>[
        NdefRecord.createText(messageEncrypted),
      ];
      try {
        await ndef.write(NdefMessage(records));
        _nfcManager.stopSession();
        completer.complete(NfcEnumState.success);
      } catch (error) {
        _nfcManager.stopSession(errorMessage: _result.value.toString());
        completer.completeError(error);
        throw Exception(error);
      }
    });
    return completer.future;
  }

  Future<NfcEnumState> read() async {
    final completer = Completer<NfcEnumState>();
    try {
      await _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
        final uint8List = Uint8List.fromList(
            tag.data['ndef']['cachedMessage']['records'][0]['payload']);
        data = String.fromCharCodes(uint8List).substring(3);
        _nfcManager.stopSession();
        completer.complete(NfcEnumState.success);
      });
    } catch (error) {
      _nfcManager.stopSession();
      completer.completeError(error);
      throw Exception(error);
    }
    return completer.future;
  }



  Future<void> update(String message) async {
    _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        _result.value = 'Tag is not ndef writable';
        _nfcManager.stopSession(errorMessage: _result.value);
        return;
      }

      final records = <NdefRecord>[
        NdefRecord.createText(message),
      ];

      try {
        await ndef.write(NdefMessage(records));
        _result.value = 'Success to "Ndef Update"';
        _nfcManager.stopSession();
      } catch (e) {
        _result.value = e;
        _nfcManager.stopSession(errorMessage: _result.value.toString());
        return;
      }
    });
  }

  Future<void> dispose() async {
    _nfcManager.stopSession();
    _result.dispose();
  }
}
