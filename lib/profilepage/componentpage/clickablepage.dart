import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickPage extends StatelessWidget {
String img;

ClickPage(this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Hero(
       tag: img,
       child: Container(
         decoration: BoxDecoration(
           image: DecorationImage(image: NetworkImage (img),fit: BoxFit.cover),
         ),
       ),
     ),

    );
  }
}
