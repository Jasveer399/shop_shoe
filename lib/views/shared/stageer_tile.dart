import 'package:flutter/material.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';

class Stagger_Tile extends StatefulWidget {
  const Stagger_Tile(
      {super.key,
      required this.image_url,
      required this.shoe_name,
      required this.shoe_price});

  final String image_url;
  final String shoe_name;
  final String shoe_price;
  @override
  State<Stagger_Tile> createState() => _Stagger_TileState();
}

class _Stagger_TileState extends State<Stagger_Tile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: mq.height * 0.2,
                width: mq.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.image_url,
                        ))),
              ),
              Container(
                padding: EdgeInsets.only(top: mq.height * 0.0009, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.shoe_name,
                      style: appstyle_WH(
                          mq.width * 0.055, Colors.black, FontWeight.bold, 1),
                    ),
                    Text(
                      '\$${widget.shoe_price}',
                      style: appstyle_WH(
                          mq.width * 0.05, Colors.black, FontWeight.bold, 1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
