import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tunzaaquiz/models/product_model.dart';
import 'package:tunzaaquiz/screens/cartpage.dart';
import 'package:tunzaaquiz/screens/searchpage.dart';
import 'package:tunzaaquiz/screens/singleProductPage.dart';
import 'package:tunzaaquiz/services/apiService.dart';
import 'package:tunzaaquiz/services/cartservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('MyShop')),
        actions: [
          IconButton(
              onPressed: (() async{
                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => CartPage())));
                final userCart = await ShopApiService().gethUserCart(1);
              }),
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SearchPage())));
              }),
              icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
        future: ShopApiService().getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // int id = snapshot.data[index]['id'];

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SingelProduct(id)));
                    },
                    onDoubleTap: () {
                      // provider.addCartPtoductList(Products());
                    },
                    child: Container(
                      height: 600,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              
                              width: 30,
                              height: 0,
                              child: IconButton(
                                  onPressed: (() {}),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.blue,
                                  )),
                            ),
                            Positioned(
                              left: 30,
                              top: 0,
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  snapshot.data[index]['image'],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              child: Text(
                                snapshot.data[index]['title'],
                                style: TextStyle(fontSize: 9),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 50,
                                child: Text(
                                    snapshot.data[index]['price'].toString())),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

// pup up to confirm
  Future<void> _confirmBox(
    BuildContext context,
    int productId,
  ) {
    // final  provider= Provider.of<CartProvider>(context);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Select your option.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('View'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingelProduct(productId)));
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add to Cart'),
              onPressed: () {
                //  ShopApiService().addItem(Products());
                // provider.addCartPtoductList(provider.cartProduct);
              },
            ),
          ],
        );
      },
    );
  }
}
