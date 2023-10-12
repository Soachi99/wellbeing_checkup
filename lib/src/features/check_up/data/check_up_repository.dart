import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/features/check_up/domain/options.dart';

class CheckUpRepository {
  Future<Options> getOptions() async {
    final String response =
        await rootBundle.loadString('assets/data/options.json');
    final data = await json.decode(response);

    return Options.fromJson(data);
  }
}

final checkUpRepositoryProvider = Provider<CheckUpRepository>(
  (ref) => CheckUpRepository(),
);
