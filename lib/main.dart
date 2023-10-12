import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellbeing_checkup/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyBiueWq8sc13nUmubAy_zU0yll_ob3jMf4",
  //         appId: "1:366491493610:android:a53cba7d06b8b0c622a393",
  //         messagingSenderId: "366491493610",
  //         projectId: "todoapp-d2e0a"));

  runApp(const ProviderScope(child: App()));
}
