
import 'package:flutter/material.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Checkout_btn extends StatelessWidget {
  const Checkout_btn({
    super.key, required this.onTap, required this.label,
  });

  final Function() onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.all(8.0),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius
                        .circular(15)),
            child: Center(
              child: Text(
                 label,
                style: appstyle(
                    20,
                    Colors.white,
                    FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
