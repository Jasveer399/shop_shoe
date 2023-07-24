import 'package:flutter/material.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Add_page extends StatelessWidget {
  const Add_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Add Page",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
      //bottomNavigationBar: Bottom_navBar(),
    );
  }
}