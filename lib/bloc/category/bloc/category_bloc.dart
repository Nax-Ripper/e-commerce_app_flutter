import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/repositories/categories/category_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo _categoryRepo;
  StreamSubscription? _categoryStreamSubscription;

  CategoryBloc({
    required CategoryRepo categoryRepo,
  })  : _categoryRepo = categoryRepo,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategory);
    on<UpdateCategories>(_onUpdateCategory);
  }

  void _onLoadCategory(LoadCategories event, Emitter<CategoryState> state) {
    _categoryStreamSubscription =
        _categoryRepo.getAllCategories().listen((product) {
      add(UpdateCategories(product));
    });

    
  }

  void _onUpdateCategory(UpdateCategories event, Emitter<CategoryState> state) {
     (CategoryLoaded(category: event.categories.toList()));
    
  }
}
