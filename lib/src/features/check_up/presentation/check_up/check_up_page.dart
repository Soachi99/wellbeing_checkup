import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_button.dart';
import 'package:wellbeing_checkup/src/widgets/custom_checkbox/custom_checkbox/custom_checkbox.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

import 'check_up_controller.dart';

class CheckUpPage extends ConsumerStatefulWidget {
  const CheckUpPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckUpState();
}

class _CheckUpState extends ConsumerState<CheckUpPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ref.watch(checkUpController.notifier).getOptions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(checkUpController.notifier);
    var state = ref.watch(checkUpController);
    return Scaffold(
      backgroundColor: customColors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Center(
              child: CustomText(
                "Well-being Check-up",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const CustomText(
              "You can choose one or more of the following to scan your wellbeing temperature. Select all three for a complete wellbeing profile.",
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 16),
            if (state.options != null) ...[
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  children: state.options!.options
                      .map((e) => CustomCheckbox(
                            id: e.id,
                            name: e.name,
                            minutes: e.minutes,
                            disabled: e.disabled,
                            images: e.image,
                            callback: (optionId) =>
                                controller.onSelectOption(optionId),
                          ))
                      .toList(),
                ),
              )
            ],
            const Spacer(),
            CustomButton(
                label: "Continue",
                disabled: !state.enableButton,
                onPressed: () {})
          ],
        ),
      )),
    );
  }
}
