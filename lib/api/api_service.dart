
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:paw_record/api/ApiConstants.dart';
import 'package:paw_record/model/LoginResponseModel.dart';


class ApiService {
  Future<LoginResponseModel?> login(String email, String password) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.post(url, body: {
        'email': email,
        'password': password
      },);
      if (response.statusCode == 200) {
        LoginResponseModel _model = loginResponseModelFromJson(response.body);
        log(response.toString());
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}