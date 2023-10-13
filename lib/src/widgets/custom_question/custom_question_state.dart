// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wellbeing_checkup/src/features/check_up/domain/select_option.dart';

class CustomQuestionState {
  SelectOption? optionSelected;

  CustomQuestionState({this.optionSelected});

  CustomQuestionState copyWith({
    SelectOption? optionSelected,
  }) {
    return CustomQuestionState(
      optionSelected: optionSelected ?? this.optionSelected,
    );
  }
}
