import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/common/firebase_cloud_service.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/options.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/question.dart';

class CheckUpRepository {
  List<Question> questions = [];

  Future<Options> getOptions() async {
    final String response =
        await rootBundle.loadString('assets/data/options.json');
    final data = await json.decode(response);

    return Options.fromJson(data);
  }

  Future<List<Question>> getQuestions(String optionId) async {
    try {
      var response = await firebaseService.getCollection(
          collection: "Questions/$optionId/Statements");

      questions = response.docs.map((e) => Question.fromMap(e.data())).toList();

      log(questions[0].name);
    } catch (e) {
      log("No se encontraron tareas");
    }

    return questions;
  }
}

final checkUpRepositoryProvider = Provider<CheckUpRepository>(
  (ref) => CheckUpRepository(),
);
