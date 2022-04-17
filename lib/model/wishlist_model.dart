import 'package:equatable/equatable.dart';

import 'package:e_commerce/model/Product_model.dart';

class Wishlist extends Equatable {
  List<Product> product;
  Wishlist({
    required this.product,
  });

  // addWishlist(Product fromDetails) {
  //   product.add(fromDetails);
  // }

  @override
  // TODO: implement props
  List<Object?> get props => [product];

  void addProduct(Product product) {}
}
