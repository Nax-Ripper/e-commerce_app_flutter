import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';

import '../order/order_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection("Orders")
        .where("isDelivered", isEqualTo: false)
        .where("isCancled", isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((docs) => Order.formSnapshot(docs)).toList();
    });
  }

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection("Orders").snapshots().map((snapshot) {
      return snapshot.docs.map((docs) => Order.formSnapshot(docs)).toList();
    });
  }

  Stream<List<AdminProduct>> getProducts() {
    return _firebaseFirestore
        .collection("Adminproducts")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((docs) => AdminProduct.fromSnapshot(docs))
          .toList();
    });
  }

  Future<void> addProduct(AdminProduct product) {
    return _firebaseFirestore.collection("Adminproducts").add(product.toMap());
  }

  Future<void> updateField(
    AdminProduct product,
    String field,
    dynamic newValue,
  ) async {
    print(field);
    print(newValue);
    double value = newValue;
    var fb = await _firebaseFirestore
        .collection("Adminproducts")
        .where("id", isEqualTo: product.id)
        .get()
        .then((qsnap) {
      print(qsnap.docs.isEmpty);
      qsnap.docs.first.reference.update({field: newValue});
    });
  }

  Future<void> updateOrder(Order order, String field, dynamic value) async {
    await _firebaseFirestore
        .collection("Orders")
        .where("id", isEqualTo: order.id)
        .get()
        .then((qsnap) => qsnap.docs.first.reference.update({field: value}));
  }
}
