import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wellbeing_checkup/src/features/check_up/presentation/check_up/check_up_page.dart';
import 'package:wellbeing_checkup/src/features/check_up/presentation/questions/questions_page.dart';

class Routes {
  static const String rootRoute = '/';
  static const String questions = '/home';
}

final goRouterProvider = Provider<GoRouter>((ref) => router);

final router = GoRouter(initialLocation: '/', routes: <GoRoute>[
  GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const CheckUpPage())),
  GoRoute(
      path: Routes.questions,
      pageBuilder: (context, state) =>
          page(state: state, child: const QuestionsPage()))
]);

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
