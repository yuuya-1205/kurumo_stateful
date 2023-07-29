import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

//ユーザーの状態の監視を行なっている。
//nullはログアウト状態
final userProvider = StreamProvider(
  (ref) => FirebaseAuth.instance.authStateChanges(),
);
