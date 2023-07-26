import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurumo_stateful/firebase_options.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/pages/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
