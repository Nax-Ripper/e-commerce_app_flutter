import 'package:e_commerce/model/user_model.dart';
import 'package:equatable/equatable.dart';

import 'package:e_commerce/model/Product_model.dart';

class Checkout extends Equatable {
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancled;
  final String userAddress;
  final String userid;
  //final MyUser? userAddress;

  Checkout(
      {required this.products,
      required this.subtotal,
      required this.deliveryFee,
      required this.total,
      required this.isAccepted,
      required this.isDelivered,
      required this.isCancled,
      required this.userAddress,
      required this.userid,
      
      });

  Map<String, Object> toDocument() {
    return {
      "products": products!.map((product) => product.name).toList(),
      "deliveryFee": deliveryFee!,
      "subTotal": subtotal!,
      "total": total!,
      "orderDate": DateTime.now(),
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'isCancled': isCancled,
      'address': userAddress,
      'userid':userid

      // 'address': userAddress
      // 'address':userAddress!.streetAddress.toString()
      // 'address':MyUser.userAddress()
    };
  }

  String user_Address() {
    MyUser user = MyUser();
    String address = user.streetAddress! +
        "," +
        user.city! +
        "," +
        user.country! +
        "," +
        user.zipCode! +
        "hello";

    print(address);

    return address;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        products,
        subtotal,
        deliveryFee,
        total,
      ];
}
