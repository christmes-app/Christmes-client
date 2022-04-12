import 'package:communi_in_geil_v2/client/client.dart';
import 'package:communi_in_geil_v2/screens/homePage.dart';
import 'package:communi_in_geil_v2/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:hive/hive.dart';

Future<void> main() async {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

