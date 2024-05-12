/*import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  static const String _keyLastAddress = 'last_address';
  static const String _keyAddresses = 'addresses';

  Future<void> saveLastAddress(String lastAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLastAddress, lastAddress);
  }

  Future<String?> getLastAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLastAddress);
  }

  Future<void> saveAddresses(List<String> addresses) async {
    final prefs = await SharedPreferences.getInstance();
    print('Addresses: ${_keyAddresses},${addresses}');
    await prefs.setStringList(_keyAddresses, addresses);
    print('Addresses: ${_keyAddresses},${addresses}');
  }

  Future<List<String>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyAddresses) ?? [];
  }
}*/

import 'package:hive/hive.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class LocalStorageRepository {
  static const String _addressesBoxName = 'addresses';
  static const String _lastAddressBoxName = 'last_address';

  Future<void> saveLastAddress(String lastAddress) async {
    final box = await Hive.openBox<String>(_lastAddressBoxName);
    await box.put('last_address', lastAddress);
  }

  Future<String?> getLastAddress() async {
    final box = await Hive.openBox<String>(_lastAddressBoxName);
    return box.get('last_address');
  }

  Future<void> saveAddresses(List<AddressModel> addresses) async {
    print(addresses);
    final box = await Hive.openBox<AddressModel>(_addressesBoxName);
    await box.clear();
    await box.addAll(addresses);
  }

  Future<List<AddressModel>> getAddresses() async {
    final box = await Hive.openBox<AddressModel>(_addressesBoxName);
    return box.values.toList();
  }
}