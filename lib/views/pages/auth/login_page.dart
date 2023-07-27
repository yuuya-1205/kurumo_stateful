import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/components/button.dart';
import 'package:kurumo_stateful/views/components/input_form.dart';
import 'package:kurumo_stateful/views/pages/auth/register_page.dart';
import 'package:kurumo_stateful/views/pages/top/top_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  ///状態を破棄するために用いる。
  ///disposeがないと状態を持ったまま
  ///再描画が行われることもあるのでバグになりやすいの？

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///setStateで呼ばれたら上から順番に再描画する。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 130,
                height: 40,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 56,
              ),
              InputForm(
                controller: emailController,
                hintText: "メールアドレス",
                labelText: "メールアドレス",
              ),
              const SizedBox(
                height: 8,
              ),
              InputForm(
                controller: passwordController,
                icon: Icons.hide_source_outlined,
                hintText: "パスワード",
                labelText: "パスワード",
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'パスワード忘れ',
              ),
              const SizedBox(
                height: 32,
              ),
              Button(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    ///repositoryパターンで使うこと。
                    // await authLogin(email: email, password: password);
                    // ignore: use_build_context_synchronously
                    await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const TopPage()),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    switch (e.code) {
                      case 'wrong-password':
                        errorMessage = 'パスワードが間違っています';
                        break;
                      case 'user-not-found':
                        errorMessage = 'メールアドレスが登録されていません';
                        break;
                      case 'invalid-email':
                        errorMessage = 'メールアドレスを入力してください';
                        break;
                      case 'too-many-requests':
                        errorMessage = 'パスワードを再設定してください';
                        break;
                    }
                  }
                },
                backgroundColor: ColorManager.primary,
                text: "ログイン",
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'または',
              ),
              const SizedBox(
                height: 32,
              ),
              Button(
                onPressed: () {},
                backgroundColor: ColorManager.primary,
                text: "Google",
              ),
              const SizedBox(
                height: 18,
              ),
              Button(
                onPressed: () {},
                backgroundColor: ColorManager.primary,
                text: "Apple",
              ),
              const SizedBox(
                height: 74,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const ResisterPage()),
                    ),
                  );
                },
                child: const Text(
                  '新規登録',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
