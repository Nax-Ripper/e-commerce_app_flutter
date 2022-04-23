import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart' as category;
import 'package:e_commerce/repositories/categories/base_category_repo.dart';
import 'package:flutter/foundation.dart';

class CategoryRepo extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<category.Category>> getAllCategories() {
    return _firebaseFirestore.collection("categories").snapshots().map((event) {
      return event.docs.map((e) => category.Category.fromSnapshot(e)).toList();
    });
  }
}
