import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:thetask/modules/orders/data/model/orders_model.dart';

class OrdersRepository {
   Future<List<OrdersModel>> getOrders() async {
     final String response = await rootBundle.loadString('assets/json/orders.json');
     final List<dynamic> data = json.decode(response);
     return data.map((json) => OrdersModel.fromJson(json)).toList();

   }
}
