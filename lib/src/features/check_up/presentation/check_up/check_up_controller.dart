import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/data/check_up_repository.dart';
import 'check_up_state.dart';

class CheckUpController extends StateNotifier<CheckUpState> {
  final CheckUpRepository repository;

  CheckUpController({required this.repository}) : super(CheckUpState());

  List<String> selectedOptions = [];

  getOptions() async {
    state = state.copyWith(options: await repository.getOptions());
  }

  onSelectOption(String optionId) {
    if (selectedOptions.contains(optionId)) {
      selectedOptions.remove(optionId);
    } else {
      selectedOptions.add(optionId);
    }

    state = state.copyWith(
        options: state.options,
        enableButton: selectedOptions.isNotEmpty,
        loadingButton: state.loadingButton);
    log(selectedOptions.toString());
  }

  onContinue() async {
    state = state.copyWith(
        options: state.options,
        enableButton: state.enableButton,
        loadingButton: true);
    await repository.getQuestions(selectedOptions[0]);
    state = state.copyWith(
        options: state.options,
        enableButton: state.enableButton,
        loadingButton: false);
  }
}

final checkUpController =
    StateNotifierProvider<CheckUpController, CheckUpState>((ref) {
  return CheckUpController(repository: ref.watch(checkUpRepositoryProvider));
});
