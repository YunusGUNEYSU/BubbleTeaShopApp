import 'package:bubble_tea_app/pages/home_page.dart';
import 'package:bubble_tea_app/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BubbleTeaShop()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.brown[200],
      primarySwatch: Colors.brown
      
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}