import 'package:flutter/material.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Search_page extends StatelessWidget {
  const Search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Search Page",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
      //bottomNavigationBar: Bottom_navBar(),
    );
  }
}