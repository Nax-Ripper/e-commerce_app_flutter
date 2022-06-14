part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final Cart? cart;
  final PaymentMethod? paymentMethod;

  UpdateCheckout({
    this.cart,
    this.paymentMethod
  });

  List<Object?> get props => [cart,paymentMethod];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;
  ConfirmCheckout({
    required this.checkout,
  });

  @override
  List<Object> get props => [checkout, ];
}
