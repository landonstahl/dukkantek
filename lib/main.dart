import 'package:flutter_dukkantek/views/layoutTemplate.dart';

import 'locator.dart';

import 'package:flutter/material.dart';

void main() {
  //Instatiates our locator services which contain our navigation and API service
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dukkantek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutTemplate(),
    );
  }
}
