part of 'common_bloc.dart';

@immutable
sealed class CommonState {}

final class CommonInitial extends CommonState {}

class GetIsNfcAvailableState extends CommonState {
  final bool isAvailable;
  GetIsNfcAvailableState(this.isAvailable);
}

class CommonErrorState extends CommonState {
  final String message;

  CommonErrorState(this.message);
}
