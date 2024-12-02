import 'package:thetask/modules/orders/data/model/orders_model.dart';

abstract class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersDone extends GetOrdersState {
  GetOrdersDone(this.orders);
  List<OrdersModel> orders ;
}

class GetOrdersEmpty extends GetOrdersState {}

class GetOrdersError extends GetOrdersState {}
