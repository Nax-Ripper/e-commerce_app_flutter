import 'package:e_commerce/screens_Admin/order/order_model.dart';
import 'package:e_commerce/screens_Admin/services/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseService databaseService = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrder = <Order>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    orders.bindStream(databaseService.getOrders());
    pendingOrder.bindStream(databaseService.getPendingOrders());
  }

  void updateOrder(Order order, String field, bool value) {
    databaseService.updateOrder(order, field, value);
  }
}
