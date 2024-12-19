import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class UserApi {
  final String _endpoint = "https://webservice.sballando.it";

  Future<Map<String, dynamic>?> login(String email,String password) async {
    Map<String, dynamic>? userAuth = {};
     final Map<String, String> body = {
        'email': email,
        'password': password
      };
    try{
      http.Response response = await http.post(Uri.parse("$_endpoint/api/user/login"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(body)
          );
      if(response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'];
        
        if (status) {
          // Se ok.. recupera i film
          userAuth = jsonResponse;
          
        }
      }
      
    } catch (e) {
        if (kDebugMode) {
                print(e);
              }
    }
    return userAuth;
  }
}
