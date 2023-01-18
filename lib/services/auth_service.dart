import 'dart:convert';

import 'package:commerce_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthService {
  String baseUrl = 'http://192.168.43.246:8000/api';
  // static const String baseUrl = 'http://10.0.2.2:8000/api';
  // String baseUrl = 'http://localhost:8000/api';

  Future<UserModel> register({
     String? name, 
     String? email, 
     String? username, 
     String? password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    });    

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<UserModel> login({
     String? email, 
     String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });    

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
  
}

