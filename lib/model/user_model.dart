

import 'dart:convert';



class UserModel {
  UserModel({
    this.person,
    this.mobile,
    this.paid,
    this.item,
  });

  String person;
  String mobile;
  bool paid;
  List<Item> item;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    person: json["person"],
    mobile: json["mobile"],
    paid: json["paid"],
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "person": person,
    "mobile": mobile,
    "paid": paid,
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.itemName,
    this.price,
    this.qty,
    this.tax,
  });

  String itemName;
  int price;
  int qty;
  int tax;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemName: json["itemName"],
    price: json["price"],
    qty: json["qty"],
    tax: json["tax"],
  );

  Map<String, dynamic> toJson() => {
    "itemName": itemName,
    "price": price,
    "qty": qty,
    "tax": tax,
  };
}
