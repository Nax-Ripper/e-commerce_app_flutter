// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onLoadCart);
    on<CartProductAdded>(_onAddProduct);
    on<CartProductRemoved>(_onRemoveProduct);
  }

  void _onLoadCart(
    CartStarted event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              cartProducts: List.from((state as CartLoaded).cart.cartProducts)
                ..add(event.product),
            ),
          ),
          
        );
        Fluttertoast.showToast(msg: "Added to Cart...",);
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(
    CartProductRemoved event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              cartProducts: List.from((state as CartLoaded).cart.cartProducts)
                ..remove(event.product),
            ),
          ),
        );
        Fluttertoast.showToast(msg: "Removed From Cart...", );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
