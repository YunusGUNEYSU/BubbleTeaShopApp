import 'package:bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:bubble_tea_app/pages/cart_page.dart';
import 'package:bubble_tea_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  navigateBottomBar(int newIndex){
setState(() {
  _selectedIndex=newIndex;
});
  }
  final List<Widget> _pages=[
    const ShopPage(),
    const CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: MyBottomBar(onTabChange: (index) =>navigateBottomBar(index) ,) ,
      body: _pages[_selectedIndex],
    );
  }
}