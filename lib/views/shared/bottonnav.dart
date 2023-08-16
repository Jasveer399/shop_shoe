import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/mainpage_controller.dart';
import 'package:shop_shoe/views/shared/bottom_nev_icon.dart';

class BottomNav_Bar extends StatelessWidget {
  const BottomNav_Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageNotifier>(
        builder: (context, mainPageNotifier, child) {
      return SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bottom_nevbaricon(
                        onTap: () {
                          mainPageNotifier.pageIndex = 0;
                        },
                        icon: mainPageNotifier.pageIndex == 0
                            ? MaterialCommunityIcons.home
                            : MaterialCommunityIcons.home_outline,
                      ),
                      Bottom_nevbaricon(
                          onTap: () {
                            mainPageNotifier.pageIndex = 1;
                          },
                          icon: mainPageNotifier.pageIndex == 1
                              ? Ionicons.search
                              : Ionicons.search),
                      Bottom_nevbaricon(
                          onTap: () {
                            mainPageNotifier.pageIndex = 2;
                          },
                          icon: mainPageNotifier.pageIndex == 2
                              ? Ionicons.heart
                              : Ionicons.heart_outline),
                      Bottom_nevbaricon(
                          onTap: () {
                            mainPageNotifier.pageIndex = 3;
                          },
                          icon: mainPageNotifier.pageIndex == 3
                              ? Ionicons.cart
                              : Ionicons.cart_outline),
                      Bottom_nevbaricon(
                          onTap: () {
                            mainPageNotifier.pageIndex = 4;
                          },
                          icon: mainPageNotifier.pageIndex == 4
                              ? Ionicons.person_circle
                              : Ionicons.person_circle_outline),
                    ]),
              )));
    });
  }
}
