import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sedra/models/constants.dart';

class RequestService {
  Dio _client;
  RequestService() {
    _client = Dio();

    _client.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
    _client.options.baseUrl = Constants.baseUrl;
    _client.options.responseType = ResponseType.json;
    _client.options.headers = {
      "accept": "application/jsson",
      "Content_Type": "application/json"
    };
  }
  Future<Response> getAsync({@required String apiEndPoint}) {
    return _client.get(apiEndPoint);
  }

  Future<Response> postAsync({@required String apiEndPoint, @required data}) {
    return _client.post(apiEndPoint);
  }
}
