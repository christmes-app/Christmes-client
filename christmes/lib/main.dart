import 'package:christmes/screens/loginPage.dart';
import 'package:christmes/client/client.dart';
import 'package:christmes/screens/homePage.dart';
import 'package:christmes/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('client');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

