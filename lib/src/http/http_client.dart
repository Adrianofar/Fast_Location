import 'package:dio/dio.dart';

class HttpClient {
  final Dio _dio = Dio();
  
  Future<Map<String, dynamic>> getAddressByCEP(String cep) async {
    try {
      Response response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load address');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}