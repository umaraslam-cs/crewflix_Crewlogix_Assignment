import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../Utils/toast_message.dart';


part 'api_client_g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        receiveTimeout: 300000,
        connectTimeout: 300000,
        headers: ({"Content-Type": "application/json", "Accept": "*/*"}));
    return _ApiClient(dio);
  }

  Future getRequest({
    required String apiUrl,
  });

 

}
