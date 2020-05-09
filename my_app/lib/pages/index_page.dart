import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/pages/cart_page.dart';
import 'package:my_app/pages/category_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/member_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.home),
       title: Text("首页"),
     ),
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.search),
       title: Text("分类"),
     ), 
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.shopping_cart),
       title: Text("购物车"),
     ),
     BottomNavigationBarItem(
       icon: Icon(CupertinoIcons.profile_circled),
       title: Text("我的"),
     ),
  ];

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0;
  var currentPage;


  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      body: currentPage,
    );
  }
}

