import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_cubit.freezed.dart';
part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final UserCubit _userCubit;
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription<InternetConnectionStatus> _connectivitySubscription;
  bool? lastConnection;
  bool? currentConnection;

  NetworkCubit(this._userCubit)
      : connectionChecker = InternetConnectionChecker.createInstance(
          slowConnectionConfig: SlowConnectionConfig(),
        ),
        super(const NetworkState.initial()) {
    _listenToNetworkChanges();
  }

  // get listener for network changes
  void _listenToNetworkChanges() {
    _connectivitySubscription = connectionChecker.onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetConnectionStatus.connected:
            currentConnection = true;
            _emitConnectionState();
            break;
          case InternetConnectionStatus.disconnected:
          case InternetConnectionStatus.slow:
            currentConnection = false;
            _emitConnectionState();
            break;
        }
      },
    );
  }

  /*
  * lost connection where is not login
  * lost connection where is login
  * */

  _emitConnectionState() {
    if (currentConnection == true) {
      emit(NetworkState.connected());
    } else if (currentConnection == false) {
      emit(NetworkState.disconnected());

      lastConnection = currentConnection;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
