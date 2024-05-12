import 'package:fast_location/src/modules/history/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            if (controller.history.isEmpty) {
              return const Text('No history yet.');
            } else {
              return ListView.builder(
                itemCount: controller.history.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(controller.history[index]),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.loadHistory();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}