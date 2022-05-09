part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  late final Checkout checkout;

  CheckoutLoaded({
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    // this.checkout,
  }) {
    checkout = Checkout(
        products: products!,
        subtotal: subtotal!,
        deliveryFee: deliveryFee!,
        total: total!
        
        );
  }

  @override
  List<Object?> get props => [products, subtotal, deliveryFee, total];
}
