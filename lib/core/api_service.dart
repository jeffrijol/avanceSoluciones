import 'dart:io';

import 'package:dio/dio.dart';
import '../config/config.dart';
import '../domain/domain.dart';

class ApiService {
  static const String _bearer = "Bearer ";

  Map<String, dynamic> _headers([bool auth = true]) {
    return {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      // HttpHeaders.acceptLanguageHeader: Locale.shortName,
      ...auth ? {'Authorization': _bearer + Token.fromStorage().access} : {}
    };
  }

  BaseOptions _options({bool auth = true}) {
    return BaseOptions(baseUrl: Enviroments.baseUrl, headers: _headers(auth));
  }

  String _cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }

    return path;
  }

  Map<String, dynamic> buildPage(int page) {
    return {'page': page};
  }

  Map<String, dynamic> buildLimit(int limit) {
    return {'limit': limit};
  }

  Map<String, dynamic> buildOwner(int userId) {
    return {'owner': userId};
  }

  Map<String, dynamic> buildStatus(String status) {
    return {'status': status};
  }

  Future<Map<String, dynamic>> getHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).get(
        _cleanPath(path),
        queryParameters: params,
      );

      if (response.statusCode == 204) {
        return {};
      }

      if (response.data == null) {
        throw Exception("Response data is null");
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}