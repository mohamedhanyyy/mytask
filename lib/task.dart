import 'package:flutter/material.dart';
import 'package:thetask/modules/orders/presentation/screens/orders_screen.dart';


class MyTaskApp extends StatelessWidget {
  const MyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OrdersScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Mohamed Hany',

    );
  }
}
