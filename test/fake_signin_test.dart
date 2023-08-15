import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurumo_stateful/providers/firebase_provider/firebase_provider.dart';
import 'package:kurumo_stateful/repositories/auth_repository.dart';

void main() async {
  group('authのテスト', () {
    late final ProviderContainer container;

    setUp(() {
      container = ProviderContainer(overrides: [
        firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
      ]);
    });

    test('signInメソッドテスト', () async {
      await container.read(authRepositoryProvider).signIn(
          email: 'wheel.of.connection@gmail.com', password: 'yuuya0805');

      //signInできているか確認する方法が知りたい。

      final user = await container.read(userProvider.future);
      print(user);
    });

    test('signUpメソッドテスト', () async {
      await container
          .read(authRepositoryProvider)
          .signUp(email: 'mo-mo.1205@ezweb.ne.jp', password: 'yuuya0805');
    });
    test('signOutメソッドテスト', () async {
      await container.read(authRepositoryProvider).signOut();
    });
  });
}
