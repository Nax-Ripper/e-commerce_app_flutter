import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/repositories/categories/base_category_repo.dart';

class CategoryRepo extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepo({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection("categories")
        .snapshots()
        .map((snapshot) {
      // ignore: avoid_print
      print(snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList());
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
