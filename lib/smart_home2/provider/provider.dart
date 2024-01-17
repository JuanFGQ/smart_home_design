import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;

  set getIndex(int value) {
    _index = value;
    notifyListeners();
  }

  String _switchArg = "off";

  String get switchArg => _switchArg;
  set switchArg(String value) {
    _switchArg = value;
    notifyListeners();
  }

  turnOnDevice(String arg) async {
    Dio dio = Dio();

    String url = "http://192.168.1.74:8081/zeroconf/switch";

    Map<String, dynamic> requestBody = {
      "deviceid": "1001402eea",
      "data": {"switch": arg}
    };

    await dio.post(url,
        data: requestBody,
        options: Options(contentType: Headers.jsonContentType));
  }
}
