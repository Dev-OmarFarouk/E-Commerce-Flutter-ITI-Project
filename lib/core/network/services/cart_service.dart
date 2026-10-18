import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Models/cart_item.dart';


class CartService {
  static final _db = FirebaseFirestore.instance;

  static String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  static CollectionReference<Map<String, dynamic>>? _itemsRef() {
    final uid = _uid;
    if (uid == null) return null;
    return _db.collection('users').doc(uid).collection('items');
  }

  static Stream<List<CartItem>> watchCart() {
    final ref = _itemsRef();
    if (ref == null) return Stream.value([]);
    return ref.snapshots().map(
          (snap) =>
              snap.docs.map((d) => CartItem.fromMap(d.id, d.data())).toList(),
        );
  }

  static num parsePrice(String priceText) {
    final clean = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
    if (clean.isEmpty) return 0;
    if (clean.contains('.')) return double.parse(clean);
    return int.parse(clean);
  }

  static Future<void> addToCart({
    required String title,
    required String image,
    required String priceText,
    required String size,
  }) async {
    final ref = _itemsRef();
    if (ref == null) return;

    final docs = (await ref.get()).docs;
    for (final d in docs) {
      final data = d.data();
      if (data['title'] == title && data['size'] == size) {
        return;
      }
    }

    await ref.add({
      'title': title,
      'image': image,
      'price': parsePrice(priceText),
      'size': size,
    });
  }

  static Future<void> removeItem(String docId) async {
    final ref = _itemsRef();
    if (ref == null) return;
    await ref.doc(docId).delete();
  }

  static Future<void> clearCart() async {
    final ref = _itemsRef();
    if (ref == null) return;
    final docs = (await ref.get()).docs;
    for (final d in docs) {
      await d.reference.delete();
    }
  }
}
