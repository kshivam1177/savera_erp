import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioAdapter {
  static HttpClientAdapter getAdapter() {
    return IOHttpClientAdapter()
      ..createHttpClient = () {
        return HttpClient()
          ..badCertificateCallback = (x509, host, port) => true;
      };
  }
}
