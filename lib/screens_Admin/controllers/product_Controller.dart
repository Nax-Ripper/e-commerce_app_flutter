import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  // make list as observable
  List<AdminProduct> adminProduct = AdminProduct.staticProducts.obs;

  Map newProduct = {}.obs;

  get price => newProduct["price"];
  get quantity => newProduct["quantity"];
  get isRecomended => newProduct["isRecomended"];
  get isPopular => newProduct["isPopular"];

  void updateProductPrice(int i, AdminProduct product, double passprice) {
    product.price = passprice;
    adminProduct[i] = product;
  }

  void updateProductQuantity(int i, AdminProduct product, int qty) {
    product.quantity = qty;
    adminProduct[i] = product;
  }
}
