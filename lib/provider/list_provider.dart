import 'package:flutter/material.dart';

class UserListProvider extends ChangeNotifier{
  List<String> userList = [];

  void addName(String name){ //add method
    userList.add(name);
    notifyListeners();//update userList widget
  }

  void deleteName(int index){ //remove method
    userList.removeAt(index);
    notifyListeners();
  }
}