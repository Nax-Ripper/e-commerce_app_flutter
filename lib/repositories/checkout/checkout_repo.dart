import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce/model/checkout_model.dart';
import 'package:e_commerce/repositories/checkout/base_checkout_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckoutRepo extends BaseCheckoutRepo {
  late final FirebaseFirestore _firebaseFirestore;
  late final FirebaseAuth _auth;

  CheckoutRepo(
      {FirebaseFirestore? firebaseFirestore, FirebaseAuth? firebaseAuth}) {
    if (firebaseFirestore == null && firebaseAuth == null) {
      _firebaseFirestore = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
    } else {
      _firebaseFirestore = firebaseFirestore!;
      _auth = firebaseAuth!;
    }
  }

  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("Checkout History")
        .add(checkout.toDocument());
  }
}
