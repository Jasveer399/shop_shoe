import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_shoe/main.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key, required this.image_url,
  });

  final String image_url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: mq.height * 0.12,
          width: mq.width * 0.28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            imageUrl:
                image_url,
          ),
        ),
      ),
    );
  }
}
