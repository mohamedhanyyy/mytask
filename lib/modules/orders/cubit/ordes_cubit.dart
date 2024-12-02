import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thetask/modules/orders/cubit/orders_state.dart';
import 'package:thetask/modules/orders/data/model/orders_model.dart';

import '../data/data_source/orders_data_source.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());
  final ordersRepository = OrdersRepository();
  Future<void> getOrders() async {
    emit(GetOrdersInitial());
    final List<OrdersModel> list = await ordersRepository.getOrders();
    emit(GetOrdersDone(list));
  }
}
