import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/select_option.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_question/custom_question_controller.dart';
import 'package:wellbeing_checkup/src/widgets/custom_radio_button/custom_radio_button.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

typedef Callback = void Function(int value);

class CustomQuestion extends ConsumerWidget {
  final String questionId;

  final String questionName;

  final bool enabled;

  final Callback callback;

  const CustomQuestion(
      {super.key,
      required this.questionId,
      required this.questionName,
      required this.callback,
      required this.enabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(customQuestionController(questionId).notifier);
    var state = ref.watch(customQuestionController(questionId));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            questionName,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: enabled
                ? customColors.black
                : customColors.black.withOpacity(0.2),
          ),
          const SizedBox(height: 16),
          Center(
            child: CustomRadioButton(
                enabled: enabled,
                options: [
                  SelectOption(label: "1", value: 1),
                  SelectOption(label: "2", value: 2),
                  SelectOption(label: "3", value: 3),
                  SelectOption(label: "4", value: 4),
                  SelectOption(label: "5", value: 5),
                  SelectOption(label: "6", value: 6),
                ],
                answer:
                    state.optionSelected ?? SelectOption(label: "", value: 0),
                onTap: enabled
                    ? (e) {
                        controller.updateSelectedOption(e);
                        callback(e.value);
                      }
                    : (e) {}),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "At no time",
                fontSize: 14,
                textColor: enabled
                    ? customColors.black
                    : customColors.black.withOpacity(0.2),
              ),
              CustomText(
                "All the time",
                fontSize: 14,
                textColor: enabled
                    ? customColors.black
                    : customColors.black.withOpacity(0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
