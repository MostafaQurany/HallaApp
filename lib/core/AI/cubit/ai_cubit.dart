import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/ai/repo/ai_repo.dart';

part 'ai_cubit.freezed.dart';
part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AIRepo aiRepo;

  AiCubit(
    this.aiRepo,
  ) : super(const AiState.initial());

  getTags(String description) async {
    emit(const AiState.loading());
    final tags = await aiRepo.getTags(description);
    tags.fold(
      (l) => emit(AiState.error(l.message)),
      (r) => emit(AiState<Map<String, dynamic>>.loaded(r)),
    );
  }
}
