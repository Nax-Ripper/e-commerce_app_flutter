part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

//  it has 2 events :
//  1. Load categories
//  2. update categories

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<Category> categories;

  UpdateCategories(this.categories);

   @override
  List<Object> get props => [categories];
}
