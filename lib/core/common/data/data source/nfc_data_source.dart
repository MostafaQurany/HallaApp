import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halla/core/common/data/models/nfc_message_model.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:nfc_manager/nfc_manager.dart';

enum NfcUse {
  success,
  fail,
}

abstract interface class NfcDataSource {
  Future<bool> getNFCIsAvailable();

  Future<bool> getNFCIsOpen();

  Future<NfcUse> write(NfcMessageModel nfcMessage);

  Future<NfcMessageModel> read();
}

class NfcDataSourceImpl implements NfcDataSource {
  final String channelName = 'Back_End_Channel';

  final NfcManager _nfcManager = NfcManager.instance;

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
  Future<NfcUse> write(NfcMessageModel nfcMessage) async {
    final completer = Completer<NfcUse>();
    final messageEncrypted = nfcMessage.toDecrypt();
    final records = <NdefRecord>[
      NdefRecord.createText(messageEncrypted),
    ];
    _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      try {
        await ndef?.write(NdefMessage(records));
        _nfcManager.stopSession();
        completer.complete(NfcUse.success);
      } catch (error) {
        _nfcManager.stopSession(errorMessage: _result.value.toString());
        completer.completeError(error);
        throw ServerException(error.toString());
      }
    });
    return completer.future;
  }

  @override
  Future<NfcMessageModel> read() async {
    final Completer<NfcMessageModel> completer = Completer<NfcMessageModel>();
    try {
      await _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
        try {
          final uint8List = Uint8List.fromList(
              tag.data['ndef']['cachedMessage']['records'][0]['payload']);
          data = String.fromCharCodes(uint8List).substring(3);

          completer.complete(NfcMessageModel.fromDecrypt(data ?? ''));
        } catch (error) {
          completer.completeError(ServerException(error.toString()));
        } finally {
          _nfcManager.stopSession();
        }
      });
      return completer.future;
    } catch (error) {
      _nfcManager.stopSession();
      throw ServerException(error.toString());
    }
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
