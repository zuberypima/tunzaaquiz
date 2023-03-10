import 'package:flutter/material.dart';
import 'package:tunzaaquiz/models/product_model.dart';
import 'package:tunzaaquiz/services/apiService.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}
// final userCart = await ShopApiService().getCartProducts();
late Future<List<Products>> _cartProductsFuture;

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
    _cartProductsFuture =ShopApiService().getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    // final provider =Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Products'),
      ),
      body: Center(
        child: FutureBuilder<List<Products>>(
          future: _cartProductsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    // leading: Image.network(product.image.toString()),
                    title: Text(product.title.toString()),
                    subtitle: Text(product.description.toString()),
                    trailing: Text('\$${product.price.toString()}'),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}