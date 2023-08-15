import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurumo_stateful/model/trader/trader.dart';

final fireStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final traderRepositoryProvider = Provider<TraderRepository>((ref) {
  return TraderRepository(ref.watch(fireStoreProvider));
});

class TraderRepository {
  TraderRepository(this.firestore);
  final FirebaseFirestore firestore;

  final traderCollection = FirebaseFirestore.instance.collection('trader');
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> updateTrader(Trader trader) async {
    traderCollection.doc().set(
          trader.toJson(),
          SetOptions(merge: true),
        );
  }
}
