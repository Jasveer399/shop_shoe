import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/favorites_controller.dart';
import 'package:shop_shoe/controller/product_provider.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/constant.dart';
import 'package:shop_shoe/models/sneaker_models.dart';
import 'package:shop_shoe/services/helper.dart';
import 'package:shop_shoe/views/pages/favorites.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/checkout_btn.dart';

class Product_page extends StatefulWidget {
  const Product_page({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  late Future<Sneakers> _sneakers;
  final PageController pageController = PageController();
  final _cartbox = Hive.box('cart_box');
  final _favbox = Hive.box('fav_box');
  void getshoe() {
    if (widget.category == "Men's Running") {
      _sneakers = Helper().getMaleSneakersid(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneakers = Helper().getfemaleSneakersid(widget.id);
    } else {
      _sneakers = Helper().getkidsSneakersid(widget.id);
    }
  }

  Future<void> _createcart(Map<String, dynamic> newcart) async {
    await _cartbox.add(newcart);
  }

 

  @override
  void initState() {
    super.initState();
    getshoe();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteNotifier = Provider.of<FavoriteNotifier>(context, listen: true);
    favoriteNotifier.getfavrites();
    mq = MediaQuery.of(context).size;
    return FutureBuilder<Sneakers>(
        future: _sneakers,
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
            final sneakers = snapshot.data!;
            return Scaffold(body: Consumer<ProductNotifier>(
                builder: (context, productNotifier, child) {
              return CustomScrollView(slivers: [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    leadingWidth: 0,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    snap: false,
                    floating: true,
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              productNotifier.shoesize.clear();
                              Navigator.pop(context);
                            },
                            child: Icon(
                              AntDesign.close,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Ionicons.ellipsis_horizontal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    expandedHeight: mq.height,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        SizedBox(
                          width: mq.width,
                          height: mq.height * 0.5,
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: pageController,
                              itemCount: sneakers!.imageUrl.length,
                              onPageChanged: (page) {
                                productNotifier.activepage = page;
                              },
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      height: mq.height * 0.39,
                                      width: mq.width,
                                      color: Colors.grey.shade300,
                                      child: CachedNetworkImage(
                                        imageUrl: sneakers.imageUrl[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        top: mq.height * 0.09,
                                        right: 20,
                                        child: Consumer<FavoriteNotifier>(
                                            builder: (context, favoriteNotifier,
                                                child) {
                                          return GestureDetector(
                                              onTap: () {
                                                if (favoriteNotifier.ids
                                                    .contains(sneakers.id)) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Favorites()));
                                                } else {
                                                  favoriteNotifier.createfav({
                                                    "id": sneakers.id,
                                                    "name": sneakers.name,
                                                    "category":
                                                        sneakers.category,
                                                    "price": sneakers.price,
                                                    "imageurl":
                                                        sneakers.imageUrl[0],
                                                  });
                                                  setState(() {});
                                                }
                                              },
                                              child: favoriteNotifier.ids
                                                      .contains(sneakers.id)
                                                  ? Icon(
                                                      AntDesign.heart,
                                                    )
                                                  : Icon(AntDesign.hearto));
                                        })),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        top: mq.height * 0.17,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                              sneakers.imageUrl.length,
                                              (index) => Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4),
                                                    child: CircleAvatar(
                                                      radius: 5,
                                                      backgroundColor:
                                                          productNotifier
                                                                      .activepage !=
                                                                  index
                                                              ? Colors.grey
                                                              : Colors.black,
                                                    ),
                                                  )),
                                        )),
                                  ],
                                );
                              }),
                        ),
                        Positioned(
                            bottom: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              child: Container(
                                height: mq.height * 0.645,
                                width: mq.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: mq.height * 0.015,
                                      ),
                                      Text(
                                        sneakers.name,
                                        style: appstyle(
                                            30, Colors.black, FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            sneakers.category,
                                            style: appstyle(20, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                          RatingBar.builder(
                                              initialRating: 1,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemSize: 22,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.black,
                                                    size: 18,
                                                  ),
                                              onRatingUpdate: (rating) {})
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${sneakers.price}",
                                            style: appstyle(25, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Colors",
                                                style: appstyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Select Size",
                                                style: appstyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Text(
                                                "View Size",
                                                style: appstyle(20, Colors.grey,
                                                    FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          //
                                          SizedBox(
                                            height: 70,
                                            child: ListView.builder(
                                                itemCount: productNotifier
                                                    .shoesize.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ChoiceChip(
                                                      selectedColor:
                                                          Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      disabledColor:
                                                          Colors.white,
                                                      label: Text(
                                                        productNotifier
                                                                .shoesize[index]
                                                            ["size"],
                                                        style: appstyle(
                                                            15,
                                                            productNotifier.shoesize[
                                                                        index][
                                                                    "isSelected"]
                                                                ? Colors.white
                                                                : Colors.black,
                                                            FontWeight.w400),
                                                      ),
                                                      selected: productNotifier
                                                              .shoesize[index]
                                                          ["isSelected"],
                                                      onSelected: (newstate) {
                                                        if (productNotifier
                                                            .sizes
                                                            .contains(
                                                                productNotifier
                                                                            .shoesize[
                                                                        index]
                                                                    ['size'])) {
                                                          productNotifier.sizes
                                                              .remove(productNotifier
                                                                      .shoesize[
                                                                  index]["size"]);
                                                        } else {
                                                          productNotifier.sizes
                                                              .add(productNotifier
                                                                      .shoesize[
                                                                  index]["size"]);
                                                        }
                                                        print(productNotifier
                                                            .sizes);
                                                        productNotifier
                                                            .togglecolor(index);
                                                      },
                                                    ),
                                                  );
                                                }),
                                          ),
                                          Divider(
                                            //height: 2,
                                            thickness: 2,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 40),
                                            child: SizedBox(
                                              width: mq.width * 0.8,
                                              child: Text(
                                                sneakers.title,
                                                style: appstyle(
                                                    20,
                                                    Colors.black,
                                                    FontWeight.w900),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            sneakers.description,
                                            maxLines: 4,
                                            textAlign: TextAlign.justify,
                                            style: appstyle(17, Colors.black,
                                                FontWeight.w400),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 22),
                                              child: Checkout_btn(
                                                onTap: () async {
                                                  _createcart({
                                                    "id": sneakers.id,
                                                    "name": sneakers.name,
                                                    "category":
                                                        sneakers.category,
                                                    "sizes":
                                                        productNotifier.sizes,
                                                    "imageurl":
                                                        sneakers.imageUrl[0],
                                                    "price": sneakers.price,
                                                    "qty": 1,
                                                  });

                                                  Navigator.pop(context);
                                                  productNotifier.sizes.clear();
                                                },
                                                label: "Add To Cart",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ]),
                    ))
              ]);
            }));
          }
        });
  }
}
