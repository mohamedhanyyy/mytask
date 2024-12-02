import 'package:flutter/material.dart';
import 'package:thetask/resources/images.dart';

import '../../../../resources/colors.dart';

class MetricsScreen extends StatelessWidget {
  final Map<String, dynamic> metrics;

  const MetricsScreen({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders Metrics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(AppImages.orders, width: 200, height: 200)),
            const SizedBox(height: 60),
            RichText(
                text: TextSpan(
                    text: 'Total Orders:    ',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: '${metrics['totalCount']} Order',
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ])),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RichText(
                  text: TextSpan(
                      text: 'Average Price:    ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: '${metrics['averagePrice'].toStringAsFixed(2)} \$',
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )
                  ])),
            ),
            RichText(
              text: TextSpan(
                text: 'Returned Orders:    ',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '${metrics['returnsCount']} Order',
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
