import 'package:flutter/material.dart';
import 'package:tunzaaquiz/models/cartmodel.dart';

class CartProvider extends ChangeNotifier{
  List <dynamic> _cartProduct =[];
  List<dynamic> get cartProduct =>_cartProduct;

// Future<Cart> addCartPtoductList(int userId)async{
//   final isExist =_cartProduct.contains(cartProduct);
//   if(isExist){
//     _cartProduct.remove(cartProduct);
//   }
//   else{
//     _cartProduct.add(cartProduct);
//     print(_cartProduct);
//   }
//   notifyListeners();
// }  
// bool isExist(Products cartProduct){
//     final isExist =_cartProduct.contains(cartProduct);
//   return isExist;
// }
}