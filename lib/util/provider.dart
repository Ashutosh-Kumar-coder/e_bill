// import 'package:e_bill/model/item_model.dart';
import 'dart:convert';

import 'package:e_bill/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider with ChangeNotifier {
  String title = "Paid Bills";
  bool paid = true;
  List<String> userList;




  void updateTitle(String title) {
    this.title = title;
    paid = !paid;
    notifyListeners();
  }

  //Add User
  void addUserList(String user) {
    userList?.add(user);
    print("aaaa=$user");
    notifyListeners();
  }

  //Reset userList
  void resetUserList() {
    userList.clear();
    notifyListeners();
  }

// void getData() async {
//   var pref = await SharedPreferences.getInstance();
//   if(userList.isNotEmpty){
//     userKey.forEach((element) {
//         user.add(json.decode(pref.getString("$element")));
//     });
//   }
//   else{
//     print("userList is null");
//   }
//   notifyListeners();
// }

}
