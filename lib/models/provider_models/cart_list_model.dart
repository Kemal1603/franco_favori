import 'package:flutter/material.dart';

import '../Product.dart';


class UsersCartList extends ChangeNotifier{


   List <Product> items = [];
   double sum = 0;

  void addCart({Product cart}) {

    this.items.add(cart);
    this.sum += cart.price * cart.pickedQuantity;
    notifyListeners();

  }

   void removeCart({int index}) {
    this.sum -= items[index].price * items[index].pickedQuantity;
     this.items.removeAt(index);
     notifyListeners();

   }


}

