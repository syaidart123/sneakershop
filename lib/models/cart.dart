import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  //liat of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Max',
      price: '3.500.000',
      description: 'Air Max Shoes',
      imagePath: 'lib/images/Air Max.png',
    ),
    Shoe(
      name: 'Nike Air Force',
      price: '3.900.000',
      description: 'Nike Air Force',
      imagePath: 'lib/images/Nike Air Force.png',
    ),
    Shoe(
      name: 'Nike Blazer',
      price: '2.500.000',
      description: 'Nike Blazer',
      imagePath: 'lib/images/Nike Blazer.png',
    ),
    Shoe(
      name: 'Nike Pegasus',
      price: '3.200.000',
      description: 'Nike Pegasus',
      imagePath: 'lib/images/Nike Pegasus.png',
    ),
  ];

  // list of stems in user cart
  List<Shoe> userCart = [];

  get cartItems => null;

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
