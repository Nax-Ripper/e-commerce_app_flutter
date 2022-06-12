import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce/model/checkout_model.dart';
import 'package:e_commerce/model/user_model.dart';
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

  getAdddress() async {
    var address = await FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get();
    String street, city, country, zip;
    city = address.data()!["city"];
    street = address.data()!["streetAddress"];
    country = address.data()!["country"];
    zip = address.data()!["zipCode"];

    String fullAddress = street + " " + zip + " " + city + " " + country;
    print(fullAddress);
    return fullAddress;
  }

  @override
   addCheckout(
    Checkout checkout,
  ) async{
    // print(MyUser.userAddress());

    var address= await getAdddress();
    _firebaseFirestore
        .collection("orders")
        .add(
          checkout.toDocument(),
        )
        .then((value) => value.update({"address": address}));

    return _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("Checkout History")
        .add(checkout.toDocument());
  }
}
