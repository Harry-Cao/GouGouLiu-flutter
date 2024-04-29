import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gougouliu_flutter/modules/home/model/home_post_model.dart';
import 'package:gougouliu_flutter/modules/home/view/home_post_cell.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomePostModel> allPosts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://f3.ttkt.cc:15791/api/home/post'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["data"] != null) {
          List<HomePostModel> posts = (data["data"] as List)
              .map((e) => HomePostModel.fromJson(e))
              .toList();
          setState(() {
            allPosts = posts;
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: allPosts.length,
        itemBuilder: (context, index) =>
            HomePostCell(postModel: allPosts[index]),
      ),
    );
  }
}
