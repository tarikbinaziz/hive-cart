import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/utils/request_handler.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    addApiInterceptors(_dio);
  }

  Map<String, dynamic> defaultHeaders = {
    HttpHeaders.authorizationHeader:
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDZjMzEyMDNhODFlZjNlMTI4Yjc0MTRiNjFkNzU2NGNkMDE1MDc5MmFiOWY1MTQzOWQ0ZDk3NzY0YTY1NDM5ZjU3ZWY1NDliNGQwZTNmNTEiLCJpYXQiOjE3MTQ3NDk2MDguNTkyMDI0LCJuYmYiOjE3MTQ3NDk2MDguNTkyMDI3LCJleHAiOjE3NDYyODU2MDguNTc2NDY0LCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.1SvsfqPMTqBAHxyLUEL4ZuNMjR85QDnocTvWt8-4QgySmaYk0ad1zgdmjMQOR_XaetONC_LbmZODIuNPCvtcCQdrbeif3qJhJRRO2CnN1sP6YAaA_k8-FuiF9LgpQfZuMuSmY8DjCfhHR7c8GFdZN_QfYhhlHHvUIWO0pdZXs3o48ew9VRXO-41jmx3agkHftpHFsgZM_ATQcaaLH434ToGfI7BMumdCXF5p3r-Zx-NAJAnYn2-GwEuZrjHkOIKzsUV_CMAxQdwWpyjRpr3zjtrRCroDmpkfnMJ1EPSzz7zs8VjHYMu32omk4B5mIIX2nFAR_jZhh_peWpNkd03laAjtD3krE48KfRITU4X4oE-oQ1J77f8vPAvTXTS0T5nNCwzXIsn43xEw3oHQ8jFiILJVtV3pLSOR-tGAUNbH6WrbbsIwN9HIuIP9RrvoMIQtRidNDxwhB0iPAA26BecZ_jbWOD-ZN4ZJlXuqtALlykzHy5ASEzPLOp8rJ3S2PdbZT5wxVnbcEwurM7K61hcRCy4mhFqNwaiUc3g5VcIVBKRjS0kZ5oyHYCeCy_TFUsrF9Edj9so3sHlGmPbEJId_3aV3ObB7hslWXrAqs8NIggVF2piH7KRnXahg9zDCd7D6jIIKr9X6UXX7L_fM46BkYzz8BLdr7OsGEwxI_f2AETc",
  };

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    return _dio.get(
      url,
      queryParameters: query,
      options: Options(headers: defaultHeaders),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.delete(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  void updateToken({required String token}) {
    defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(
        'Update Token:${defaultHeaders[HttpHeaders.authorizationHeader]}');
  }
}

final apiClientProvider = Provider((ref) => ApiClient());
