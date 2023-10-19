
import 'package:flutter/material.dart';

Widget buildPage(int index){
  List<Widget> _widgets = [
    Center(child: Text("home")),
    Center(child: Text("search")),
    Center(child: Text("play")),
    Center(child: Text("chat")),
    Center(child: Text("frofile")),
  ];
  return _widgets[index];
}