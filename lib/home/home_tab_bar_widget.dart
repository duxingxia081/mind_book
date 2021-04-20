import 'package:flutter/material.dart';
import 'package:mind_book/app/app_color.dart';
import 'package:mind_book/home/home_list_page.dart';

class HomeTabBarWidget extends StatefulWidget {
  @override
  _HomeTabBarWidgetState createState() => _HomeTabBarWidgetState();
}

class _HomeTabBarWidgetState extends State<HomeTabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<Tab> _tabs = [
    Tab(text: '精选'),
    Tab(text: '女生'),
    Tab(text: '男生'),
  ];

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: TabBar(
          controller: _controller,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelColor: AppColor.darkGrey,
          indicatorColor: AppColor.orange,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3,
          indicatorPadding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          tabs: _tabs,
        )),
      ),
      body: TabBarView(
        controller: _controller,
        children: [HomeListPage(), HomeListPage(), HomeListPage()],
      ),
    );
  }
}
