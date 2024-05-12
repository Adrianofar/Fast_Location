import 'package:fast_location/src/modules/history/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location/src/modules/home/components/address_list.dart';
import 'package:fast_location/src/modules/home/components/empty_address_search.dart';
import 'package:fast_location/src/modules/home/components/last_address.dart';
import 'package:fast_location/src/modules/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();
  final HistoryController historyController = HistoryController();
  final TextEditingController _cepController = TextEditingController();

  HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cepController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Digite o CEP',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String cep = _cepController.text;
                      if (cep.isNotEmpty) {
                        controller.getAddressByCEP(cep);
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                print('Addresses: ${controller.addresses}');
                if (historyController.history.isEmpty) {
                  return const EmptyAddressSearch();
                } else {
                  return AddressList(historyController.history);
                }
              },
            ),
            const SizedBox(height: 20.0),
            Observer(
              builder: (_) => LastAddress(controller.lastAddress),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.navigateToHistoryPage(context);
        },
        child: const Icon(Icons.history),
      ),
    );
  }
}

mixin isEmpty {
}