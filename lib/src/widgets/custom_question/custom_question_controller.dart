import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/select_option.dart';

import 'custom_question_state.dart';

class CustomQuestionController extends StateNotifier<CustomQuestionState> {
  CustomQuestionController() : super(CustomQuestionState());

  updateSelectedOption(SelectOption selectOption) {
    state = state.copyWith(optionSelected: selectOption);
  }
}

final customQuestionController = StateNotifierProvider.autoDispose
    .family<CustomQuestionController, CustomQuestionState, String>((ref, arg) {
  return CustomQuestionController();
});
