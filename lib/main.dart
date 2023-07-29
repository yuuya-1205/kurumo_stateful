import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurumo_stateful/firebase_options.dart';
import 'package:kurumo_stateful/providers/firebase_provider/firebase_provider.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/pages/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    overrides: [
      firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorManager.primary,
        useMaterial3: false,
      ),
      home: const LoginPage(),
    );
  }
}
