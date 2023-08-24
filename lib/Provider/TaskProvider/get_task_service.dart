
import 'dart:convert';

import 'package:activos/Constants/url.dart';
import 'package:activos/Model/task_model.dart';
import 'package:activos/Provider/Database/db_provider.dart';
import 'package:http/http.dart' as http;

class GetUserTask {

  final url = AppUrl.baseUrl;

  Future<TaskModel> getTask() async {
     final userId = await DatabaseProvider().getUserId();
    final token = await DatabaseProvider().getToken();

    String urlFinal = "$url/users/$userId/tasks?lastId=&pagination=20";

    try {
      final request = await http
          .get(Uri.parse(urlFinal), headers: {'Authorization': 'Bearer $token'});


      if (request.statusCode == 200 || request.statusCode == 201){

        if (json.decode(request.body)['tasks'] == null) {
          return TaskModel();
        } else {
          final taskModel = taskModelFromJson(request.body);
          return taskModel;
        }
      } else {
        // final notificationModel = notificationModelFromJson(request.body);

        return TaskModel();
      }
    } catch (e) {
      return Future.error(e.toString());
    }

  }

}