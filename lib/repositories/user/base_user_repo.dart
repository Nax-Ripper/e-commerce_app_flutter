import 'package:e_commerce/model/user_model.dart';

abstract class BaseUserRepo {
  Stream<MyUser> getOnlySpecificUser();
}
