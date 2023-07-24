// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Bottom_nevbaricon extends StatelessWidget {
   Bottom_nevbaricon({
    this.icon,
    this.onTap,
    super.key,
  });
  IconData? icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}
