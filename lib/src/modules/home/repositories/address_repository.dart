import 'package:fast_location/src/http/http_client.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressRepository {
  final HttpClient _httpClient = HttpClient();

  Future<AddressModel> getAddressByCEP(String cep) async {
    try {
      final Map<String, dynamic> data = await _httpClient.getAddressByCEP(cep);
      return AddressModel(
        cep: data['cep'],
        logradouro: data['logradouro'],
        complemento: data['complemento'],
        bairro: data['bairro'],
        localidade: data['localidade'],
        uf: data['uf'],
        ibge: data['ibge'],
        gia: data['gia'],
        ddd: data['ddd'],
        siafi: data['siafi'],
      );
    } catch (e) {
      throw Exception('Failed to fetch address');
    }
  }
}