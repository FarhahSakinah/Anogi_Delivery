import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders = FirebaseFirestore.instance.collection('Orders');

  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      await orders.add({
        'receipt': receipt,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving order: $e');
    }
  }
}
