import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gougouliu_flutter/main_container/home/model/home_post_model.dart';
import 'package:gougouliu_flutter/main_container/home/view/home_post_cell.dart';
import 'package:gougouliu_flutter/modules/post/post.dart';
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
          await http.get(Uri.parse('http://192.168.0.211:8888/api/home/post'));
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
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: allPosts.length,
        itemBuilder: (context, index) {
          final postModel = allPosts[index];
          return HomePostCell(
            postModel: postModel,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostPage(postModel: postModel))),
          );
        },
      ),
    );
  }
}
