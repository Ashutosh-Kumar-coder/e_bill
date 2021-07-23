import 'dart:async';

import 'package:e_bill/screen/home_page.dart';
import 'package:e_bill/util/res.dart';
import 'package:e_bill/widget/form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetupPassword extends StatefulWidget {
  @override
  _SetupPasswordState createState() => _SetupPasswordState();
}

class _SetupPasswordState extends State<SetupPassword> {
  String user="";
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        brightness: Brightness.dark,
        title: Text("Setup Password"),
      ),
      body: Container(
        height: size.height - AppBar().preferredSize.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormData("Enter Business Name", "Eg.ABC Retail",
                  TextInputType.name, false,controller),
              FormData("Enter Business Address", "",
                  TextInputType.streetAddress, false,controller),
              FormData("Enter Contact number", "", TextInputType.number, false,controller),
              FormData("Create new password", "New password",
                  TextInputType.visiblePassword, true,controller),
              FormData("Confirm password", "Re-enter password",
                  TextInputType.visiblePassword, true,controller),
              SizedBox(
                height: 20.0,
              ),
              Builder(
                builder: (ctx) {
                  return Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      child: Text("SETUP",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      onPressed: () async {
                        setState(() {
                          user="user";
                        });
                        Resources.getMessage(ctx, "Setup Successfully");
                        bool result=await Resources.savePref("user", user);
                        if(result){

                          Timer(Duration(seconds: 2), () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => HomePage()),
                                    (route) => false);
                          });
                        }
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
    );
  }

}
