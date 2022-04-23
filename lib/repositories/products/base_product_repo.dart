import 'package:e_commerce/model/Product_model.dart';

abstract class BaseProductRepo {
  Stream<List<Product>> getAllProduct();
}
