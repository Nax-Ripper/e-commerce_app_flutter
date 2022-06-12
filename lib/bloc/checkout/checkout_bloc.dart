import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/checkout_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/repositories/checkout/checkout_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepo _checkoutRepo;
  StreamSubscription? _cartSubs;
  StreamSubscription? _checkoutSubs;
  User? user = FirebaseAuth.instance.currentUser;
  MyUser loggedUser = const MyUser();

  void initState() {
    
     FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUser = MyUser.fromMap(value.data());
      
    });
  }

  CheckoutBloc({required CartBloc cartBloc, required CheckoutRepo checkoutRepo ,})
      : _cartBloc = cartBloc,
        _checkoutRepo = checkoutRepo,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.cartProducts,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFee.toString(),
                subtotal:
                    (cartBloc.state as CartLoaded).cart.subtotal.toString(),
                total: (cartBloc.state as CartLoaded).cart.total.toString(),
                // userAddress: MyUser.userAddress()
                
                )
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _cartSubs = _cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    if (state is CheckoutLoaded) {
      final state = this.state as CheckoutLoaded;
      emit(
        CheckoutLoaded(
            deliveryFee: event.cart?.deliveryFee.toString() ??
                state.deliveryFee.toString(),
            products: event.cart?.cartProducts ?? state.products,
            subtotal:
                event.cart?.subtotal.toString() ?? state.subtotal.toString(),
            total: event.cart?.total.toString() ?? state.total.toString(),
            // userAddress: MyUser.userAddress()
            ),
            

          
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubs?.cancel();
    if (state is CheckoutLoaded) {
      if (event.checkout.subtotal != "0.0") {
        print(event.checkout.subtotal);
        try {
          await _checkoutRepo.addCheckout(event.checkout ,);
          print("Done");
        } catch (_) {}
      } else {
        Fluttertoast.showToast(msg: "Add item to cart First!");
      }
    }
  }

  @override
  Future<void> close() {
    _cartSubs?.cancel();
    return super.close();
  }
}
