import 'package:flutter/material.dart';
import 'package:portfolio/page/projects/list_projects.dart';

import 'page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/list-projects': (context) => const ListProjects(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Danny Putra Pertama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}
