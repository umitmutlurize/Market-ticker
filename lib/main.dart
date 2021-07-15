import 'package:flutter/material.dart';
import 'package:marketticker/view/homeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Market ticker',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.black),
      ),
      home: HomeView(),
    );
  }
}
