import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

abstract class BaseApiProvider {
  final String _baseUrl = 'https://18.220.196.14:3004';
  final Map<String, String> _headers = {'content-type': 'application/json'};

  Future<http.Response> postJson(url, {body}) async {
    // http.~だと自己署名証明書のhttps通信ができないのでhttpClient.badCertificateCallbackでfalse返却で対応
    //var response = await http.post(url, headers: _headers, body: body);
    HttpClient httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    IOClient client = IOClient(httpClient);
    String targetUrl = '$_baseUrl$url';
    var response = await client.post(targetUrl, headers: _headers, body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Access failed url: $targetUrl');
    }
  }
}
