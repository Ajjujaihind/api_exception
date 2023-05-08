import 'dart:convert';
import 'dart:io';

import 'package:api_example/model/wallpaper_model.dart';
import 'package:api_example/my_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class Apihelper {
  Future<dynamic> getApi(String url, {Map<String, String>? header}) async {
    String baseurl = "https://api.pexels.com/v1/";
    late var JsonResponce;
    try {
      var responce =
          await httpClient.get(Uri.parse('$baseurl$url'), headers: header);
      JsonResponce = checkResponce(responce);
    } on SocketException {
      throw NetworkUnreachableException("No internet connection");
    }
    return JsonResponce;
  }

  dynamic checkResponce(httpClient.Response responce) {
    switch (responce.statusCode) {
      case 200:
        var responseJsonData = jsonDecode(responce.body.toString());
        return responseJsonData;
      case 400:
        throw BadRequestException(responce.body.toString());
      case 401:
        throw UnauthorisedException(responce.body.toString());
      case 404:
        throw InvalidInputException(responce.body.toString());

      default:
        throw FetchDataException(
            'Error occuredr while communication  with server with status code : ${responce.statusCode.toString()}');
    }
  }
}
