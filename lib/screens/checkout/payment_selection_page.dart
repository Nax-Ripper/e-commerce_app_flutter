import 'dart:io';

import 'package:e_commerce/bloc/payment/payment_bloc.dart';
import 'package:e_commerce/model/payment_method_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

class PaymentSelection extends StatelessWidget {
  const PaymentSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Payment Selection"),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Platform.isIOS
                    ? RawApplePayButton(
                        style: ApplePayButtonStyle.black,
                        type: ApplePayButtonType.inStore,
                        onPressed: () {
                          print("Apple Pay Selected");
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(),
                Platform.isAndroid
                    ? RawGooglePayButton(
                        style: GooglePayButtonStyle.black,
                        type: GooglePayButtonType.pay,
                        onPressed: () {
                          context.read<PaymentBloc>().add(
                               const SelectPaymentMethod(
                                  paymentMethod: PaymentMethod.google_pay));
                          print("Google pay");
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add( const SelectPaymentMethod(
                        paymentMethod: PaymentMethod.COD));
                    print("COD");
                    Navigator.pop(context);
                  },
                  child: const Text("Cash On Delivery"),
                )
              ],
            );
          } else {
            return const Text("Something Went Wrong");
          }
        },
      ),
    );
  }
}
