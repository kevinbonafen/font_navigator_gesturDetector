import 'package:flutter/material.dart';
import 'package:project_finance_app/user%20interface/main_pages.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(), 
      theme: ThemeData(primarySwatch: Colors.deepPurple,),
      debugShowCheckedModeBanner: false,
      );
  }
}