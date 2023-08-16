import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/product_provider.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/sneaker_models.dart';
import 'package:shop_shoe/views/pages/product_card_page.dart';
import 'package:shop_shoe/views/pages/product_page.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/newshoe.dart';
import 'package:shop_shoe/views/shared/product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productnotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
            width: mq.width,
            height: mq.height * 0.4,
            child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error ${snapshot.error}"),
                    );
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: male!.length,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: mq.height * 0.4,
                                width: mq.width * 0.6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    productnotifier.shoesize = shoe.sizes;
                                    print(productnotifier.shoesize);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Product_page(
                                                id: shoe.id,
                                                category: shoe.category)));
                                  },
                                  child: Product_Card(
                                    id: shoe.id,
                                    image_name: shoe.imageUrl[0],
                                    shoe_name: shoe.name,
                                    category: shoe.category,
                                    shoe_price: shoe.price,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoe',
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductCard_page(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Show All',
                          style: appstyle(20, Colors.black, FontWeight.w500),
                        ),
                        Icon(
                          AntDesign.caretright,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
            height: mq.height * 0.13,
            child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  } else {
                    final male = snapshot.data!;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: male.length,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return NewShoes(
                            image_url: shoe.imageUrl[1],
                          );
                        });
                  }
                })),
      ],
    );
  }
}
