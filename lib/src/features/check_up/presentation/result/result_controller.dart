import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/data/check_up_repository.dart';
import 'result_state.dart';

class ResultController extends StateNotifier<ResultState> {
  final CheckUpRepository repository;

  ResultController(this.repository) : super(ResultState());
}

final resultController =
    StateNotifierProvider.autoDispose<ResultController, ResultState>((ref) {
  return ResultController(ref.watch(checkUpRepositoryProvider));
});
