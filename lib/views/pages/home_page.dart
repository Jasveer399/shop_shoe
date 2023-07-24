import 'package:flutter/material.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Home Page",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
      //bottomNavigationBar: Bottom_navBar(),
    );
  }
}