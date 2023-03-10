import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunzaaquiz/models/product_model.dart';
import 'package:tunzaaquiz/services/cartservice.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider =Provider.of<CartProvider>(context);
    final carts =provider.cartProduct;
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page'),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Products().title.toString()));
      
        },
      ),
    );
  }
}