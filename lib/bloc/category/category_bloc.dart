import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/repositories/categories/category_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  
   final CategoryRepo _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepo categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (products) => add(
            UpdateCategories(products),
          ),
        );
  }

  void _onUpdateCategories(
    UpdateCategories event,
    Emitter<CategoryState> emit,
  ) {
    emit(
      CategoryLoaded(categories: event.categories),
    );
  }



}
