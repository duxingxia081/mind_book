import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mind_book/bookshelf/bookshelf_page.dart';
import 'package:mind_book/home/home_page.dart';
import 'package:mind_book/me/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);
  var _currentIndex = 0;
  late DateTime prePressDt; //上次点击返回时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [BookshelfPage(), HomePage(), MyPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_sharp), label: '书架'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: '书城'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: '我的'),
          ],
        ),
      ),
      onWillPop: () async {
        if (prePressDt == null ||
            DateTime.now().difference(prePressDt) > Duration(seconds: 2)) {
          prePressDt = DateTime.now();
          Fluttertoast.showToast(msg: "再点击一次可退出应用");
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
    );
  }
}
