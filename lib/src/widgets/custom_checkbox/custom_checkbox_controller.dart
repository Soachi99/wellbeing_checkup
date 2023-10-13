import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'custom_checkbox_state.dart';

class CustomCheckboxController extends StateNotifier<CustomCheckboxState> {
  CustomCheckboxController() : super(CustomCheckboxState());

  toogleSelected() {
    state = state.copyWith(isSelected: !state.isSelected);
  }

  setDisabled(bool isDisabled) {
    state = state.copyWith(isDisabled: isDisabled);
  }
}

final customCheckboxController = StateNotifierProvider.autoDispose
    .family<CustomCheckboxController, CustomCheckboxState, String>((ref, arg) {
  return CustomCheckboxController();
});
