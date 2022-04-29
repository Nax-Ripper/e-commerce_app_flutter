import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/repositories/user/base_user_repo.dart';

class UserRepo extends BaseUserRepo {
  late FirebaseFirestore _firebaseFirestore;
  late FirebaseAuth _auth;

  UserRepo({FirebaseFirestore? firebaseFirestore, FirebaseAuth? firebaseAuth}) {
    if (_firebaseFirestore == null && _auth == null) {
      _firebaseFirestore = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
    }
  }

  // UserRepo(this._firebaseFirestore, this._auth);

  @override
  Stream<MyUser> getOnlySpecificUser() {
    return _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .snapshots()
        .map((event) => MyUser.formSnapshot(event));
  }
}
