import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/repositories/products/base_product_repo.dart';

class ProductRepo extends BaseProductRepo{

 final FirebaseFirestore _firebaseFirestore;

  ProductRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    return _firebaseFirestore.collection("products").snapshots().map((event) {
      return event.docs.map((e) => Product.fromSnapshot(e)).toList();
    });
  }

}