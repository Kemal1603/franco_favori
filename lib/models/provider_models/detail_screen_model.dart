import 'package:flutter/material.dart';



class DetailScreenModel extends ChangeNotifier{
  Color color;

  void changeBackgroundColor(Color color){
    this.color = color;
    notifyListeners();
  }
}