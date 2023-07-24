import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:shop_shoe/views/pages/add_page.dart';
import 'package:shop_shoe/views/pages/cart_page.dart';
import 'package:shop_shoe/views/pages/home_page.dart';
import 'package:shop_shoe/views/pages/profile_page.dart';
import 'package:shop_shoe/views/pages/search_page.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/bottom_nev_icon.dart';

class Main_page extends StatefulWidget {
  Main_page({super.key});


  @override
  State<Main_page> createState() => _Main_pageState();
}

  List<Widget> pageList = [
    Home_page(),
    Search_page(),
    Add_page(),
    Cart_page(),
    Profile_page(),
  ];

class _Main_pageState extends State<Main_page> {
  int pagreIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pageList[pagreIndex],
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Bottom_nevbaricon(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_page()));
              },
              icon: MaterialCommunityIcons.home,
            ),
            Bottom_nevbaricon(onTap: () {}, icon: Ionicons.search),
            Bottom_nevbaricon(onTap: () {}, icon: Ionicons.add),
            Bottom_nevbaricon(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cart_page()));
                },
                icon: Ionicons.cart),
            Bottom_nevbaricon(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile_page()));
                },
                icon: Ionicons.person),
          ]),
        ),
      )),
    );
  }
}
