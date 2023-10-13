// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wellbeing_checkup/src/features/check_up/domain/question.dart';

class QuestionsState {
  List<Question>? questions;
  Map<String, int>? selectedOptions;
  bool questionsCompleted;

  QuestionsState(
      {this.questions, this.selectedOptions, this.questionsCompleted = false});

  QuestionsState copyWith({
    List<Question>? questions,
    Map<String, int>? selectedOptions,
    bool? questionsCompleted,
  }) {
    return QuestionsState(
      questions: questions ?? this.questions,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      questionsCompleted: questionsCompleted ?? this.questionsCompleted,
    );
  }
}
