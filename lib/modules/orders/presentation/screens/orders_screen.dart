import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thetask/modules/orders/cubit/orders_state.dart';
import 'package:thetask/modules/orders/cubit/ordes_cubit.dart';
import 'package:thetask/modules/orders/presentation/screens/metrics_screen.dart';

import '../../data/model/matrics_calculator.dart';
import 'graph_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Statistics"),
      ),
      body: BlocProvider<GetOrdersCubit>(
        create: (context) => GetOrdersCubit()..getOrders(),
        child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
            builder: (context, state) {
          if (state is GetOrdersLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GetOrdersDone) {
            final metrics = MetricsCalculator.calculateMetrics(state.orders);
            final graphData = MetricsCalculator.prepareGraphData(state.orders);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    trailing: const Icon(Icons.arrow_forward),
                    leading: const Icon(Icons.auto_graph_sharp),
                    title: const Text('Metrics Screen'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MetricsScreen(metrics: metrics),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    trailing: const Icon(Icons.arrow_forward),
                    leading: const Icon(Icons.show_chart),
                    title: const Text('Graph Screen'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GraphScreen(graphData: graphData),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetOrdersError) {
            return const Text('Error in getting orders');
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
