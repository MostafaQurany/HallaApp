part of 'connection_cubit.dart';

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState.initial() = _Initial;

// connection then lost connection while is login => contact screen
  const factory ConnectionState.connectionThenLostConnectionWhileIsLogin() =
      ConnectionThenLostConnectionWhileIsLogin;

// lost connection then reconnect while is login => app online
  const factory ConnectionState.lostConnectionThenReconnectWhileIsLogin() =
      LostConnectionThenReconnectWhileIsLogin;

// connection then lost connection while is log out  => close app
  const factory ConnectionState.connectionThenLostConnectionWhileIsLogOut() =
      ConnectionThenLostConnectionWhileIsLogOut;
}
