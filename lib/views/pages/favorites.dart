import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/favorites_controller.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/constant.dart';
import 'package:shop_shoe/views/pages/mainpage.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/bottonnav.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  @override
  Widget build(BuildContext context) {
  var favoriteNotifier = Provider.of<FavoriteNotifier>(context);
    favoriteNotifier.getalldata();
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: mq.height,
        width: mq.width,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.all(40),
            width: 30,
            height: 30,
            color: Colors.black,
            child: Icon(AntDesign.close,color: Colors.white,),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 15, 0, 0),
            height: mq.height * 0.4,
            width: mq.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text(
                "My Favorites",
                style: appstyle(35, Colors.white, FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: favoriteNotifier.fav.length,
                padding: EdgeInsets.only(top: 100),
                itemBuilder: (context, index) {
                  final favshoe = favoriteNotifier.fav[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: mq.height * 0.11,
                        width: mq.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CachedNetworkImage(
                                imageUrl: favshoe['imageurl'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 30, top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      favshoe['name'],
                                      style: appstyle(
                                          18, Colors.black, FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      favshoe['category'],
                                      style: appstyle(14, Colors.grey.shade700,
                                          FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$${favshoe['price']}',
                                      style: appstyle(
                                          18, Colors.black, FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    favoriteNotifier.deletefav(favshoe['key']);
                                    favoriteNotifier.ids.removeWhere(
                                        (element) => element == favshoe['id']);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Main_page()));
                                  },
                                  child: Icon(Ionicons.md_heart_dislike))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
