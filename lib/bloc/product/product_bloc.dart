import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/repositories/products/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepo productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProducts);
    on<UpdateProduct>(_onUpdateProducts);
  }

  void _onLoadProducts(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProduct().listen(
          (products) => add(
            UpdateProduct(products),
          ),
        );
  }

  void _onUpdateProducts(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoaded(products: event.products));
  }
}
