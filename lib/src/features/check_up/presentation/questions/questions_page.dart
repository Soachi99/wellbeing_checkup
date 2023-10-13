import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellbeing_checkup/src/tools/tools.dart';
import 'package:wellbeing_checkup/src/widgets/custom_button.dart';
import 'package:wellbeing_checkup/src/widgets/custom_question/custom_question.dart';
import 'package:wellbeing_checkup/src/widgets/custom_text.dart';

import 'questions_controller.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionsState();
}

class _QuestionsState extends ConsumerState<QuestionsPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(questionsController.notifier).getQuestions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(questionsController.notifier);
    var state = ref.watch(questionsController);
    return Scaffold(
      backgroundColor: customColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                "Wellbeing",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 31,
              ),
              const CustomText(
                'Please respond to each item by marking one box per row.',
                fontSize: 16,
              ),
              if (state.questions != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: dimens.fullHeight(context) * .7,
                    child: SingleChildScrollView(
                      child: Column(
                          children: state.questions!.map((e) {
                        return CustomQuestion(
                          enabled: e.id == "1"
                              ? true
                              : state.selectedOptions![
                                      (int.parse(e.id) - 1).toString()] !=
                                  0,
                          questionId: e.id,
                          questionName: e.name,
                          callback: (value) => controller.onAnswer(e.id, value),
                        );
                      }).toList()),
                    ),
                  ),
                )
              ],
              const Spacer(),
              CustomButton(
                  disabled: !state.questionsCompleted,
                  label: "Continue",
                  onPressed: () => {
                        context.go(Routes.result,
                            extra: controller.calculateResult())
                      })
            ],
          ),
        ),
      ),
    );
  }
}
