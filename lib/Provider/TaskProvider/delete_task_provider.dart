import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:activos/Constants/url.dart';
import 'package:activos/Provider/Database/db_provider.dart';
import 'package:activos/Screens/RentalHouse/rental_house_home.dart';
import 'package:activos/Utils/routers.dart';

class DeleteTaskProvider extends ChangeNotifier {
  final url = AppUrl.baseUrl;

  bool _status = false;

  String _response = '';

  bool get getStatus => _status;

  String get getResponse => _response;

  ///To get graphql client

  ///Add task method
  void deleteTask({String? taskId, BuildContext? ctx}) async {
    final token = await DatabaseProvider().getToken();
    _status = true;
    notifyListeners();

    final urlFinal = "$url/tasks/$taskId";

    final result = await http
        .delete(Uri.parse(urlFinal), headers: {'Authorization': "Bearer $token"});


    if (result.statusCode == 200 || result.statusCode == 201) {
      final res = result.body;
      _status = false;

      _response = json.decode(res)['message'];

      notifyListeners();
      PageNavigator(ctx: ctx).nextPageOnly(page: const RentalHouseHome());
    } else {
      final res = result.body;
      _status = false;

      _response = json.decode(res)['message'];

      notifyListeners();
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}
