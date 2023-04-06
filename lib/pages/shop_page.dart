import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/pages/order_page.dart';
import 'package:bubble_tea_app/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void goToOrderPage(Drink drink){
    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(drink: drink) ,));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text("Bubble Tea Shop", style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getShop.length,
                  itemBuilder: (BuildContext context, int index) {
                    Drink drink = value.getShop[index];
                    return DrinkTile(
                      icon: Icons.arrow_forward_ios_rounded,
                      drink: drink,
                      onTap: () => goToOrderPage(drink),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
