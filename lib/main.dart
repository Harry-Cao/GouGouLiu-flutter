import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/main_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GouGouLiu',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          highlightColor: Colors.black.withAlpha(50),
          splashColor: Colors.transparent),
      home: const MainContainer(),
    );
  }
}
