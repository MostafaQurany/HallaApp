part of 'network_cubit.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = _Initial;

  const factory NetworkState.beggingConnection({required bool isConnected}) =
      BeggingConnection;

  const factory NetworkState.disconnected() = Disconnected;

  const factory NetworkState.connected() = Connected;
}
