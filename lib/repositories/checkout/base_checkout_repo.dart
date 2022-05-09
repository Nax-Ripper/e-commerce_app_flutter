import 'package:e_commerce/model/checkout_model.dart';

abstract class BaseCheckoutRepo {
  Future<void> addCheckout(Checkout checkout);
}
