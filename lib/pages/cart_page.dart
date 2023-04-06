import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink){
    context.read<BubbleTeaShop>().deleteDrinkUserCart(drink);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(builder: (context, value, child) => SafeArea(
      child: Column(
        children: [
          Text(
            "Your Cart",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(child: ListView.builder(
            itemCount: value.getUserCart.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (BuildContext context, int index) {
              Drink drink=value.getUserCart[index];
              return Column(
                children: [
                  DrinkTile(drink: drink, icon: Icons.delete, onTap: () => removeFromCart(drink)),
                  const SizedBox(height: 10,)
                ],
              );
            },
          ),),
          MaterialButton(onPressed: () {
            //payment

          },
          color: Colors.brown,
          child: Text("Pay",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    ),);
  }
}
