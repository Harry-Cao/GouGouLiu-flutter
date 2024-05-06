import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserNetworkHelper {
  Future<UserModel?> fetchUser(String userId) async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.0.211:8888/api/user?userId=$userId'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json case {"data": Map<String, dynamic> userJson}) {
          return UserModel.fromJson(userJson);
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
