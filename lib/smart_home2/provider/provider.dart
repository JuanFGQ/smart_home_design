import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  int _index = 0;
  bool _activeLamp = false;

  int get getIndex => _index;

  set getIndex(int value) {
    _index = value;
    notifyListeners();
  }

  bool get activeLamp => _activeLamp;
  set activeLamp(bool value) {
    _activeLamp = value;
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
