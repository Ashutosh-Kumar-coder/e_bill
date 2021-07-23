
import 'dart:convert';

import 'package:e_bill/screen/add_new_customer.dart';
import 'package:e_bill/util/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = '';

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<MainProvider>(context, listen: true);


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddNewCustomer()));
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow.shade700,
      ),
      appBar: AppBar(
        title: Text(provider.title),
        actions: [
          TextButton(
              onPressed: () {
                provider.paid
                    ? provider.updateTitle("UnPaid Bills")
                    : provider.updateTitle("Paid Bills");
              },
              child: provider.paid
                  ? Text(
                      "Show Unpaid Bills",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  : Text("Show Paid Bills",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)))
        ],
      ),
      body: Container(
        height: size.height - AppBar().preferredSize.height,
        width: size.width,
        child: SingleChildScrollView(
          child:  Container(
            child: Text("${provider.userList?.map((e) => e)}"),
          ),
        ),
      ),
    );
  }
}
