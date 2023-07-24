import 'package:flutter/material.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Center(
        child: Text("Profilr Page",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
      //bottomNavigationBar: Bottom_navBar(),
    );
  }
}