import 'package:fast_location/src/shared/metrics/app_metrics.dart';
import 'package:flutter/material.dart';

class LastAddress extends StatelessWidget {
  final String lastAddress;

  const LastAddress(this.lastAddress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppMetrics.margin),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(AppMetrics.margin),
      ),
      child: Text(
        'Last Address: $lastAddress',
        style: const TextStyle(fontSize: AppMetrics.padding),
      ),
    );
  }
}