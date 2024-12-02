import 'orders_model.dart';

class MetricsCalculator {
  static Map<String, dynamic> calculateMetrics(List<OrdersModel> orders) {
    int totalCount = orders.length;
    int returnsCount = orders.where((o) => o.status == 'RETURNED').length;
    double averagePrice = orders.fold<double>(
        0.0,
            (sum, order) =>
        sum +
            double.parse(
                order.price?.replaceAll(',', '').replaceAll('\$', '') ??
                    '0')) /
        (orders.isNotEmpty ? orders.length : 1);
    return {
      'totalCount': totalCount,
      'returnsCount': returnsCount,
      'averagePrice': averagePrice,
    };
  }

  static Map<String, int> prepareGraphData(List<OrdersModel> orders) {
    final Map<String, int> graphData = {};
    for (var order in orders) {
      String date = order.registered?.split('T').first ?? 'Unknown';
      graphData[date] = (graphData[date] ?? 0) + 1;
    }
    return graphData;
  }
}
