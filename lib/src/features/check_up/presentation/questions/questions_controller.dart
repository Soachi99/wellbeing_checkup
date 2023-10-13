import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/data/check_up_repository.dart';
import 'questions_state.dart';

class QuestionsController extends StateNotifier<QuestionsState> {
  final CheckUpRepository repository;

  Map<String, int> selectedOptions = {};

  QuestionsController({required this.repository}) : super(QuestionsState());

  getQuestions() {
    for (var e in repository.questions) {
      selectedOptions[e.id] = 0;
    }
    state = state.copyWith(
        questions: repository.questions, selectedOptions: selectedOptions);
  }

  onAnswer(String questionId, int questionValue) {
    selectedOptions.update(questionId, (value) => value = questionValue);
    state = state.copyWith(
        questions: state.questions,
        selectedOptions: selectedOptions,
        questionsCompleted: state.questionsCompleted);

    if (int.parse(questionId) == state.questions!.length) {
      state = state.copyWith(
          questions: state.questions,
          selectedOptions: selectedOptions,
          questionsCompleted: true);
    }
  }

  int calculateResult() {
    double sum = 0;
    for (var e in state.questions!) {
      sum += ((state.selectedOptions![e.id]! - 1) / 5);
    }
    return ((sum / state.questions!.length) * 100).round();
  }
}

final questionsController =
    StateNotifierProvider.autoDispose<QuestionsController, QuestionsState>(
        (ref) {
  return QuestionsController(repository: ref.watch(checkUpRepositoryProvider));
});
