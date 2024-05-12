import 'dart:io';

import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalStorage {
  static const String _addressesBoxName = 'addresses';
  static const String _lastAddressBoxName = 'last_address';
  
  static get path_provider => null;

  static Future<void> initHiveDatabase() async {
    if (kIsWeb) {
        final Directory dir = await getApplicationDocumentsDirectory();
        await Hive.initFlutter(dir.path);
    } else {
        var appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    }
  }

  Future<void> saveLastAddress(String lastAddress) async {
    final box = await Hive.openBox<String>(_lastAddressBoxName);
    await box.put('last_address', lastAddress);
  }

  Future<String?> getLastAddress() async {
    final box = await Hive.openBox<String>(_lastAddressBoxName);
    return box.get('last_address');
  }

  Future<void> saveAddresses(List<AddressModel> addresses) async {
    final box = await Hive.openBox<AddressModel>(_addressesBoxName);
    await box.clear(); // Limpa os dados anteriores
    await box.addAll(addresses);
  }

  Future<List<AddressModel>> getAddresses() async {
    final box = await Hive.openBox<AddressModel>(_addressesBoxName);
    return box.values.toList();
  }
}

class PathProviderIOS {
  static void registerWith() {}
}