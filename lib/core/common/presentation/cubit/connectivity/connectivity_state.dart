part of 'connectivity_cubit.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class CurrentSateChanged extends ConnectivityState {
  final ConnectivityTransmetions connectivityTransmetions;

  CurrentSateChanged({required this.connectivityTransmetions});
}
