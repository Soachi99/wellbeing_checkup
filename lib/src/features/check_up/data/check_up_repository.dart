import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckUpRepository {
 
}

final checkUpRepositoryProvider = Provider.autoDispose<CheckUpRepository>(
  (ref) => CheckUpRepository(),
);