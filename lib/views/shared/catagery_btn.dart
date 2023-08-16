import 'package:flutter/material.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Catagery_btn extends StatelessWidget {
  Catagery_btn(
      {super.key,
     required this.onPressed,
      required this.btn_color,
      required this.btn_name});
  final void Function() onPressed;
  final Color btn_color;
  final String btn_name;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: mq.width * 0.245,
        height: mq.height*0.05,
        decoration: BoxDecoration(
          border: Border.all(
            color: btn_color,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            btn_name,
            style: appstyle(20, btn_color, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
