import 'dart:convert';

import 'package:e_bill/model/user_model.dart';
import 'package:e_bill/screen/home_page.dart';
import 'package:e_bill/util/provider.dart';
import 'package:e_bill/util/res.dart';
import 'package:e_bill/widget/form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProduct extends StatefulWidget {
  final name, mobile;

  AddProduct(this.name, this.mobile);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var item = TextEditingController();
  var price = TextEditingController();
  var qty = TextEditingController();
  int tax = 5;
  List<Item> list = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter items"),
      ),
      body: Container(
        height: size.height - AppBar().preferredSize.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormData("item", "Item Description", TextInputType.text, false,
                    item),
                FormData("Selling Price", "Price per item",
                    TextInputType.number, false, price),
                FormData(
                    "Quantity", "Quantity", TextInputType.number, false, qty),
                SizedBox(
                  height: 20.0,
                ),
                Text("Tax Slab"),
                SizedBox(
                  height: 15.0,
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Text("5%"),
                      value: 5,
                    ),
                    DropdownMenuItem(
                      child: Text("12%"),
                      value: 12,
                    ),
                    DropdownMenuItem(
                      child: Text("18%"),
                      value: 18,
                    ),
                    DropdownMenuItem(
                      child: Text("28%"),
                      value: 28,
                    ),
                  ],
                  isExpanded: true,
                  value: tax,
                  onChanged: (int val) {
                    setState(() {
                      tax = val;
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    child: Text("Add Item To Bill",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    onPressed: () async {},
                    color: Colors.deepPurple.shade600,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Builder(
                  builder: (ctx) {
                    return Container(
                      width: double.infinity,
                      child: CupertinoButton(
                        // padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: Text("Finish",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        onPressed: () {
                          provider.addUserList(widget.name);
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                        },
                        color: Colors.grey.shade400,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
