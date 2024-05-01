import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/main_container/home/model/home_post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageViewModel extends ChangeNotifier {
  List<HomePostModel> allPosts = [];

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.0.211:8888/api/home/post'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json case {"data": List objs}) {
          List<HomePostModel> posts =
              objs.map((e) => HomePostModel.fromJson(e)).toList();
          allPosts = posts;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
