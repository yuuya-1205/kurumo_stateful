import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurumo_stateful/repositories/auth_repository.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/components/button.dart';
import 'package:kurumo_stateful/views/components/input_form.dart';
import 'package:kurumo_stateful/views/pages/auth/register_trader_info_page.dart';
import 'package:kurumo_stateful/views/pages/top/top_page.dart';

final emailProvider = StateProvider((ref) {
  return TextEditingController();
});

final passwordProvider = StateProvider((ref) {
  return TextEditingController();
});

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailProvider);
    final passwordController = ref.watch(passwordProvider);
    final firebaseAuth = ref.watch(authRepositoryProvider);
    String errorMessage = '';

    Future<void> authLogin({
      required String email,
      required String password,
    }) async {
      firebaseAuth.signIn(
        email: email,
        password: password,
      );
    }

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
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
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
                    ///repositoryパターンで使うこと。
                    await authLogin(email: email, password: password);
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
                      builder: ((context) => const RegisterTraderInfoPage()),
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
