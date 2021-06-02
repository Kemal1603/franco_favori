import 'package:flutter/material.dart';
import '../Cart.dart';
import '../Product.dart';


class UsersCartList extends ChangeNotifier{

   List <ReadyCart> items = [];

  void addCart({ReadyCart cart}) {

    this.items.add(cart);
    notifyListeners();

  }

   void removeCart({int index}) {

     this.items.removeAt(index);
     print(items.length);
     notifyListeners();

   }

}

