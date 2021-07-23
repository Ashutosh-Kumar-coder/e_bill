// @dart=2.9
import 'package:e_bill/screen/home_page.dart';
import 'package:e_bill/screen/setup_password_page.dart';
import 'package:e_bill/util/provider.dart';
import 'package:e_bill/util/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String user = await Resources.getPref("user");
  runApp(MyApp(user));
}

class MyApp extends StatelessWidget {
  final user;

  MyApp(this.user);

  @override
  Widget build(BuildContext context) {
    print("user$user");
    return ListenableProvider<MainProvider>(
      create: (_) => MainProvider(),
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.indigo.shade500,
                brightness: Brightness.dark,
                titleTextStyle:
                TextStyle(fontSize: 22.0, color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: user == "user" ? HomePage() : SetupPassword(),
      ),
    );
  }
}
