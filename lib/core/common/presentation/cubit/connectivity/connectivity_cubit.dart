import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

enum ConnectivityTransmetions {
  fromConnectToDisconnect,
  fromDisconnectToConnect,
  none
}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial()) {
    getCheckConnectionStates();
  }

  StreamSubscription<List<ConnectivityResult>>? subscription;
  bool isStart = true;
  bool? isLastStateConnected;
  ConnectivityTransmetions connectivityTransmetions =
      ConnectivityTransmetions.none;
  static ConnectivityCubit get(context) => BlocProvider.of(context);

  void getCheckConnectionStates() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) async {
      if (isStart) {
        isStart = false;
        isLastStateConnected = await getCurrentSateConnetion();
      }
      _checkTheLastChange(connectivityResult);
    });
  }

  Future<bool> getCurrentSateConnetion() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi)
        ? true
        : false;
  }

  _checkTheLastChange(List<ConnectivityResult> connectivityResult) {
    if (isLastStateConnected == null) {
      isLastStateConnected =
          (connectivityResult.contains(ConnectivityResult.mobile) ||
              connectivityResult.contains(ConnectivityResult.wifi));
    } else if (isLastStateConnected !=
        (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi))) {
      if (isLastStateConnected == true) {
        connectivityTransmetions =
            ConnectivityTransmetions.fromConnectToDisconnect;
        emit(CurrentSateChanged(
            connectivityTransmetions: connectivityTransmetions));
      } else {
        connectivityTransmetions =
            ConnectivityTransmetions.fromDisconnectToConnect;
        emit(CurrentSateChanged(
            connectivityTransmetions: connectivityTransmetions));
      }
      isLastStateConnected =
          (connectivityResult.contains(ConnectivityResult.mobile) ||
              connectivityResult.contains(ConnectivityResult.wifi));
    }
  }

  dispose() {
    subscription!.cancel();
  }
}
