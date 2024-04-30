import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gougouliu_flutter/main_container/home/view/home_post_cell.dart';
import 'package:gougouliu_flutter/main_container/home/view_model/home_page_view_model.dart';
import 'package:gougouliu_flutter/modules/post/post.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: viewModel.allPosts.length,
              itemBuilder: (context, index) {
                final postModel = viewModel.allPosts[index];
                return HomePostCell(
                  postModel: postModel,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostPage(postModel: postModel),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
