import 'package:e_commerce/model/category_model.dart';

abstract class BaseCategoryRepo {
  Stream<List<Category>> getAllCategories();
}
