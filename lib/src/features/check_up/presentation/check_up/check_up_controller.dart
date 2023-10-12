import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'check_up_state.dart';

class CheckUpController extends StateNotifier<CheckUpState> {
 
  CheckUpController(): super(CheckUpState());
}

final checkUpController =
    StateNotifierProvider<CheckUpController, CheckUpState>(
        (ref) {
  return CheckUpController();
});