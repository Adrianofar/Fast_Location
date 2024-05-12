import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/repositories/local_storage_repository.dart';
import 'package:fast_location/src/modules/home/service/address_service.dart';
import 'package:fast_location/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LocalStorageRepository _localStorage = LocalStorageRepository();
  final AddressService _addressService = AddressService();

  @observable
  List<AddressModel> addresses = [];

  @observable
  String lastAddress = '';

  @action
  void addAddress(AddressModel address) {
    addresses.add(address);
    print(addresses);
    _localStorage.saveAddresses(addresses.cast<AddressModel>());
  }

  @action
  void loadLastAddress() {
    lastAddress = _localStorage.getLastAddress() as String;
  }

  @action
  Future<void> getAddressByCEP(String cep) async {
    try {
      final address = await _addressService.getAddressByCEP(cep);
      addAddress(address);
    } catch (e) {
      print('Falha ao buscar endereço: $e');
    }
  }

  @action
  void navigateToHistoryPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.historyPage);
  }
}

/*final fullAddress = '${address.cep}, ${address.logradouro}, ${address.complemento}, ${address.bairro}, ${address.localidade}, ${address.uf}, ${address.ibge}, ${address.gia}, ${address.ddd}, ${address.siafi}';*/