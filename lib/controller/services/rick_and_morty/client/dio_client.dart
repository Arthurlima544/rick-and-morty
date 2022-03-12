import 'package:dio/dio.dart';
import 'package:rick_and_morty/controller/services/rick_and_morty/interface/http_client_interface.dart';

class ClientDio implements HttpClientInterface {
  Dio dio = Dio();

  @override
  Future get(String url) async {
    var response = await dio.get(url);
    return response;
  }
}
