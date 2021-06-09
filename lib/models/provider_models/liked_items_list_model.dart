import 'package:flutter/material.dart';

import '../Product.dart';

class UsersLikedList extends ChangeNotifier {
  List<Product> likedItems = [];

  void addCart({Product cart}) {
    this.likedItems.add(cart);
    notifyListeners();
  }

  void removeCart({int index}) {
    this.likedItems.removeAt(index);
    notifyListeners();
  }
}
