import 'package:facebookui/config/palette.dart';
import 'package:facebookui/screens/home_screen.dart';
import 'package:facebookui/screens/screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(myapp());

  
}
class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    
  return MaterialApp(
title: 'Flutter facebook ui ',
debugShowCheckedModeBanner: false,
theme: ThemeData(primarySwatch: Colors.blue,
visualDensity: VisualDensity.adaptivePlatformDensity,
scaffoldBackgroundColor: Palette.scaffold

),
home: NavScreen(),

  );
  }
}