import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/repositories/address_repository.dart';

class AddressService {
  final AddressRepository _addressRepository = AddressRepository();

  Future<AddressModel> getAddressByCEP(String cep) async {
    return await _addressRepository.getAddressByCEP(cep);
  }
}