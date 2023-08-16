import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/mainpage_controller.dart';
import 'package:shop_shoe/views/pages/favorites.dart';
import 'package:shop_shoe/views/pages/cart_page.dart';
import 'package:shop_shoe/views/pages/home_page.dart';
import 'package:shop_shoe/views/pages/profile_page.dart';
import 'package:shop_shoe/views/pages/search_page.dart';
import 'package:shop_shoe/views/shared/bottonnav.dart';

class Main_page extends StatefulWidget {
  Main_page({super.key});

  @override
  State<Main_page> createState() => _Main_pageState();
}

List<Widget> pageList = [
  Home_page(),
  Search_page(),
  Favorites(),
  Cart_page(),
  Profile_page(),
];

class _Main_pageState extends State<Main_page> {
  int pagreIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageNotifier>(
        builder: (context, mainPageNotifier, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: pageList[mainPageNotifier.pageIndex],
        bottomNavigationBar: BottomNav_Bar(),
      );
    });
  }
}
