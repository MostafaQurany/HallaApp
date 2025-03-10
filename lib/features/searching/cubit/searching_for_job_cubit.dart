import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/features/searching/repo/searching_repo.dart';

part 'searching_for_job_cubit.freezed.dart';
part 'searching_for_job_state.dart';

class SearchingForJobCubit extends Cubit<SearchingForJobState> {
  SearchingRepo searchingRepo;

  SearchingForJobCubit(this.searchingRepo)
      : super(const SearchingForJobState.initial());

  searchForTag(String jobTag) async {
    emit(const SearchingForJobState.loading());
    final res = await searchingRepo.searchUser(jobTag: jobTag);
    res.fold(
      (l) {
        emit(SearchingForJobState.error(l.message));
      },
      (r) {
        emit(SearchingForJobState<List<User>>.loaded(r));
      },
    );
  }
}
