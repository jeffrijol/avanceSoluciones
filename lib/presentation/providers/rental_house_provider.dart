import 'dart:convert';

import 'package:activos/config/enviroments.dart';
import 'package:activos/presentation/providers/db_provider.dart';
import 'package:http/http.dart' as http;

import '../../domain/domain.dart';

class GetRentalHouse {
  final url = Enviroments.baseUrl;

  Future<List<RentalHouseModel>> getRentalHouse() async {
    final userId = await DatabaseProvider().getUserId();
    final token = await DatabaseProvider().getToken();

       
    String urlFinal = "$url/rentalHouse/user/$userId";

    try {
      final response = await http
          .get(Uri.parse(urlFinal), headers: {'Authorization': 'Bearer $token'});

    

      if (response.statusCode == 200 || response.statusCode == 201) {
        return List.from(json.decode(response.body)).map((e)=>RentalHouseModel.fromJson(e)).toList();
      } else {

        return Future.error(response.statusCode);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
