import 'package:e_commerce/model/Product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pay/pay.dart';

class GooglePay extends StatelessWidget {
  final String total;
  final List<Product> product;
  
  
  const GooglePay({Key? key, required this.total, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _paymentItems = product.map(
      (product) => PaymentItem(
        label: product.name,
        amount: product.price.toString(),
        type: PaymentItemType.item,
        status: PaymentItemStatus.final_price
      ),
    ).toList();

    _paymentItems.add(PaymentItem(label: "Total",amount: total, type: PaymentItemType.total,status: PaymentItemStatus.final_price));

    // var _paymentItems = [
    //   const PaymentItem(
    //     label: 'Total',
    //     amount: '99.99',
    //     status: PaymentItemStatus.final_price,
    //   )
    // ];

    void onGooglePayResult(PaymentRequest) {
      debugPrint(PaymentRequest.toString());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: GooglePayButton(
        paymentConfigurationAsset: "payment_profile_google_pay.json",
        onPaymentResult: onGooglePayResult,
        paymentItems: _paymentItems,

        style: GooglePayButtonStyle.white,
        type: GooglePayButtonType.pay,
        // margin: const EdgeInsets.only(top: 10),
        loadingIndicator: const CircularProgressIndicator(),
        
      ),
      
    );
  }
}
