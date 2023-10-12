// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wellbeing_checkup/src/features/check_up/domain/options.dart';

class CheckUpState {
  Options? options;
  bool enableButton;

  CheckUpState({this.options, this.enableButton = false});

  CheckUpState copyWith({
    Options? options,
    bool? enableButton,
  }) {
    return CheckUpState(
      options: options ?? this.options,
      enableButton: enableButton ?? this.enableButton,
    );
  }
}
