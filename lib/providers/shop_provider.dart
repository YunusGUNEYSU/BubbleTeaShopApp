import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier{


  // satılık listesi
  final List<Drink> _shop=[
Drink(name: "Pearl Milk Tea", prices: "4.00", imagePath: "assets/milk_tea.png"),
  ];
   List<Drink> get getShop=>_shop;

  // satın alınan listesi
  final List<Drink> _userCart=[];
  List<Drink> get getUserCart=>_userCart;

  // satın alma işlemi
  void addDrinkUserCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }

  // silme işlemi
  void deleteDrinkUserCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }
}