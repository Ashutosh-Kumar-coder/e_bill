
import 'package:e_bill/screen/add_product.dart';
import 'package:e_bill/util/provider.dart';
import 'package:e_bill/widget/form_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCustomer extends StatelessWidget {
  var name = TextEditingController();
  var mobile = TextEditingController();
//commit
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Customer Details"),
      ),
      body: Container(
        height: size.height - AppBar().preferredSize.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormData("Customer Name", "", TextInputType.text, false, name),
              FormData("Phone Number", "10-digit phone number",
                  TextInputType.number, false, mobile),
              SizedBox(
                height: 20.0,
              ),
              Builder(
                builder: (ctx) {
                  return Container(
                    width: double.infinity,
                    child: CupertinoButton(
                      child: Text("NEXT",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                AddProduct(name.text, mobile.text)));
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
