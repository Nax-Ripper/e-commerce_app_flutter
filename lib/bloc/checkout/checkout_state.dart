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
  final PaymentMethod paymentMethod;
  //final String? userAddress;
  //final MyUser? address;

  late final Checkout checkout;

  CheckoutLoaded({
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    this.paymentMethod = PaymentMethod.COD,
    //this.userAddress
    //this.address

    // this.checkout,
  }) {
    checkout = Checkout(
      products: products!,
      subtotal: subtotal!,
      deliveryFee: deliveryFee!,
      total: total!,
      isAccepted: false,
      isCancled: false,
      isDelivered: false,
      userAddress: "test",
      userid: FirebaseAuth.instance.currentUser!.uid,
      
      // userAddress: userAddress!
    );
  }

  @override
  List<Object?> get props => [products, subtotal, deliveryFee, total,paymentMethod];
}
