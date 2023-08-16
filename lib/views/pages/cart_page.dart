import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/cart_controller.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/views/pages/mainpage.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart_page extends StatefulWidget {
  const Cart_page({super.key});

  @override
  State<Cart_page> createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  @override
  Widget build(BuildContext context) {
    var cartnotifier = Provider.of<CartNotifier>(context);
    cartnotifier.getcart();
    mq = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "My Cart",
                style: appstyle(35, Colors.black, FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: mq.height * 0.73,
                child: ListView.builder(
                    itemCount: cartnotifier.cart.length,
                    itemBuilder: (context, index) {
                      final data = cartnotifier.cart[index];
                      print("Shoe Size is => ${data["sizes"]}");
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Slidable(
                            key: ValueKey(0),
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                onPressed: (context) {
                                  cartnotifier.deletecart(data['key']);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Main_page()));
                                },
                                flex: 1,
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: "Delete",
                              )
                            ]),
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(40),
                              shadowColor: Colors.black,
                              child: Container(
                                height: mq.height * 0.15,
                                width: mq.width,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEDEDED),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: data["imageurl"],
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        right: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data["name"],
                                            style: appstyle(20, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              data["category"],
                                              style: appstyle(
                                                  15,
                                                  Colors.grey.shade600,
                                                  FontWeight.bold),
                                            ),
                                          ),
                                          //  SizedBox(
                                          //       width: 5,
                                          //     ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "\$${data["price"]}",
                                                  style: appstyle(
                                                      19,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "size:",
                                                  style: appstyle(
                                                      19,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  data["sizes"].toString(),
                                                  style: appstyle(
                                                      19,
                                                      Colors.black,
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFEDEDED),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                               cartnotifier.decrement();
                                              },
                                              child: Icon(
                                                AntDesign.minussquare,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                            Text(
                                              cartnotifier.counter.toString(),
                                              style: appstyle(
                                                  15,
                                                  Colors.black,
                                                  FontWeight.w500),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cartnotifier.increment();
                                              },
                                              child: Icon(
                                                AntDesign.plussquare,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
