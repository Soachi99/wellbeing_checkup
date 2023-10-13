// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wellbeing_checkup/src/features/check_up/domain/options.dart';

class CheckUpState {
  Options? options;
  bool enableButton;
  bool loadingButton;

  CheckUpState(
      {this.options, this.enableButton = false, this.loadingButton = false});

  CheckUpState copyWith({
    Options? options,
    bool? enableButton,
    bool? loadingButton,
  }) {
    return CheckUpState(
      options: options ?? this.options,
      enableButton: enableButton ?? this.enableButton,
      loadingButton: loadingButton ?? this.loadingButton,
    );
  }
}
