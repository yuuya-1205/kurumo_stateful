import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurumo_stateful/repositories/auth_repository.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/components/button.dart';
import 'package:kurumo_stateful/views/components/input_form.dart';
import 'package:kurumo_stateful/views/pages/top/top_page.dart';

class ResisterPage extends StatefulWidget {
  const ResisterPage({super.key});

  @override
  State<ResisterPage> createState() => _ResisterPageState();
}

class _ResisterPageState extends State<ResisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';
  // late AuthRepository firebaseAuth;

  // Future<void> authUp({
  //   required String email,
  //   required String password,
  // }) async {
  //   firebaseAuth.signUp(
  //     email: email,
  //     password: password,
  //   );
  // }

  @override

  ///setStateで呼ばれたら上から順番に再描画する。
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              height: 8,
            ),
            const InputForm(
              icon: Icons.hide_source_outlined,
              hintText: "パスワード確認",
              labelText: "パスワード確認",
            ),
            const SizedBox(
              height: 32,
            ),
            Button(
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                try {
                  ///repositoryパターンで使うこと。
                  //  await authUp(email: email, password: password);
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
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
              text: "新規登録",
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  ///状態を破棄するために用いる。
  ///disposeがないと状態を持ったまま
  ///再描画が行われることもあるのでバグになりやすいの？

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
