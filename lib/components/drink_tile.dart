// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/drink_model.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final IconData icon;
 final VoidCallback onTap;
  const DrinkTile({
    Key? key,
    required this.drink,
    required this.icon,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.prices),
          leading: Image.asset(drink.imagePath),
          trailing: Icon(icon),
        ),
      ),
    );
  }
}
