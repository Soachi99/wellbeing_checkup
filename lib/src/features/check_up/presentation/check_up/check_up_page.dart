import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

import 'check_up_controller.dart';

class CheckUpPage extends ConsumerWidget {
  const CheckUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var controller = ref.watch(checkUpController.notifier);
    // var state = ref.watch(checkUpController);
    return Scaffold(
      backgroundColor: customColors.white,
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Center(
              child: CustomText("Well-being Check-up"),
            )
          ],
        ),
      )),
    );
  }
}
