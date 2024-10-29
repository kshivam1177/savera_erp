import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class DioAdapter {
  static HttpClientAdapter getAdapter() {
    // return BrowserHttpClientAdapter();
    final adapter = HttpClientAdapter() as BrowserHttpClientAdapter;
    adapter.withCredentials = false;
    return adapter;
  }
}
