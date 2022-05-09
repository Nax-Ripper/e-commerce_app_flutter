import 'package:equatable/equatable.dart';

import 'package:e_commerce/model/Product_model.dart';

class Checkout extends Equatable {
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;


  const Checkout({
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Map<String, Object> toDocument() {
    return {
      "products": products!.map((product) => product.name).toList(),
      "deliveryFee": deliveryFee!,
      "subTotal": subtotal!,
      "total": total!,
      "orderDate":DateTime.now()
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [products, subtotal, deliveryFee, total];
}
