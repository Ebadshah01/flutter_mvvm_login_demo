import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_pro/data/app_exception.dart';
import 'package:test_pro/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }
 @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url),
          // if data in row foam
          body: jsonEncode(data)
          )
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;
      default:
        throw FetchDataException(
          "Error Accoured while communication with server",
        );
    }
  }
}
