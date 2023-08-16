import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/favorites_controller.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/constant.dart';
import 'package:shop_shoe/views/pages/favorites.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Product_Card extends StatefulWidget {
  Product_Card({
    required this.category,
    required this.id,
    required this.image_name,
    required this.shoe_name,
    required this.shoe_price,
    super.key,
  });

  String image_name;
  String id;
  String category;
  String shoe_name;
  String shoe_price;

  @override
  State<Product_Card> createState() => _Product_CardState();
}

class _Product_CardState extends State<Product_Card> {
  final _favbox = Hive.box('fav_box');

  @override
  Widget build(BuildContext context) {
    final favoriteNotifier= Provider.of<FavoriteNotifier>(context,listen: true);
    favoriteNotifier.getfavrites();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                height: mq.height * 0.2,
                width: mq.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                      widget.image_name,
                    ))),
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      if (favoriteNotifier.ids.contains(widget.id)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favorites()));
                      } else {
                        favoriteNotifier.createfav({
                          "id": widget.id,
                          "name": widget.shoe_name,
                          "category": widget.category,
                          "price": widget.shoe_price,
                          "imageurl": widget.image_name,
                        });
                        setState(() {
                          
                        });
                      }
                    },
                    child: favoriteNotifier.ids.contains(widget.id)
                        ? Icon(AntDesign.heart)
                        : Icon(AntDesign.hearto))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.shoe_name,
                style: appstyle_WH(
                    mq.width * 0.077, Colors.black, FontWeight.bold, 1.1),
              ),
              Text(
                widget.category,
                style: appstyle_WH(
                    mq.width * 0.044, Colors.grey, FontWeight.bold, 1.1),
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.shoe_price}',
                style: appstyle_WH(
                    mq.width * 0.070, Colors.black, FontWeight.bold, 1.1),
              ),
              Row(
                children: [
                  Text(
                    'Colors',
                    style: appstyle_WH(
                        mq.width * 0.044, Colors.grey, FontWeight.bold, 1.1),
                  ),
                  SizedBox(
                    width: mq.width * 0.01,
                  ),
                  SizedBox(
                    width: mq.width * 0.06,
                    child: ChoiceChip(
                      label: Text(''),
                      selected: true,
                      visualDensity: VisualDensity.compact,
                      selectedColor: Colors.black,
                      shape: CircleBorder(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
