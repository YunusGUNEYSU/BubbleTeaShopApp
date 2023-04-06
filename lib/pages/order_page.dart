// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bubble_tea_app/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink_model.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  customizeSweet(double value) {
    setState(() {
      sweetValue = value;
    });
  }

  double iceValue = 0.5;
  customizeIce(double value) {
    setState(() {
      iceValue = value;
    });
  }

  double pearlValue = 0.5;
  customizePearlValue(double value) {
    setState(() {
      pearlValue = value;
    });
  }

  void addToCart() {
    context.read<BubbleTeaShop>().addDrinkUserCart(widget.drink);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        title: const Text("Successfully added to cart"),
        actions: [
          MaterialButton(onPressed: () => Navigator.pop(context),color: Colors.grey[200],child: const Text("OK"),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 250,
          child: Text(
            widget.drink.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            widget.drink.imagePath,
            width: 250,
          ),
          Column(
            children: [
              _customSlider(
                customizeValue: sweetValue,
                text: "Sweet",
                onChanged: (value) => customizeSweet(value),
              ),
              _customSlider(
                customizeValue: iceValue,
                text: "Ice",
                onChanged: (value) => customizeIce(value),
              ),
              _customSlider(
                customizeValue: pearlValue,
                text: "Pearls",
                onChanged: (value) => customizePearlValue(value),
              ),
              MaterialButton(
                onPressed: () => addToCart(),
                color: Colors.brown,
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row _customSlider({
    required double customizeValue,
    required String text,
    required void Function(double)? onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Slider(
            value: customizeValue,
            divisions: 4,
            onChanged: onChanged,
            label: customizeValue.toString(),
          ),
        ),
      ],
    );
  }
}
