import 'package:flutter/material.dart';
import 'package:mind_book/home/home_tab_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeTabBarWidget();
  }
}
