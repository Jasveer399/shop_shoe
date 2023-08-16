import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/sneaker_models.dart';
import 'package:shop_shoe/services/helper.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/catagery_btn.dart';
import 'package:shop_shoe/views/shared/latest_shoe.dart';

class ProductCard_page extends StatefulWidget {
  const ProductCard_page({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductCard_page> createState() => _ProductCard_pageState();
}

// final int tabIndex = tabIndex;

class _ProductCard_pageState extends State<ProductCard_page>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: widget.tabIndex);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getmaleShoe() {
    _male = Helper().getMaleSneakers();
  }

  void getfemaleShoe() {
    _female = Helper().getfemaleSneakers();
  }

  void getkidsShoe() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getmaleShoe();
    getkidsShoe();
    getfemaleShoe();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/nike.png",
    "assets/images/jordan.png",
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Color(0xFF000000),
          // ),
          body: SingleChildScrollView(
              child: SizedBox(
                  height: mq.height,
                  child: Stack(children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 15, 0, 0),
                      height: mq.height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/top_image.png"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: mq.width * 0.02,
                              right: mq.width * 0.02,
                              top: mq.height * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    AntDesign.close,
                                    color: Colors.white,
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    filter();
                                  },
                                  child: Icon(
                                    FontAwesome.sliders,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: mq.height * 0.02),
                          child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Colors.transparent,
                              controller: _tabController,
                              isScrollable: true,
                              labelColor: Colors.white,
                              labelStyle:
                                  appstyle(20, Colors.white, FontWeight.bold),
                              unselectedLabelColor:
                                  Colors.grey.withOpacity(0.3),
                              tabs: [
                                Text("Men Shoes"),
                                Text("Women Shoes"),
                                Text("Kids Shoes"),
                              ]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: mq.height * 0.15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child:
                            TabBarView(controller: _tabController, children: [
                          LatestShoe(male: _male),
                          LatestShoe(male: _female),
                          LatestShoe(male: _kids),
                        ]),
                      ),
                    ),
                  ])))),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        //barrierColor: Colors.white,
        builder: (context) => Container(
              height: mq.height * 0.84,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: mq.height * 0.7,
                    child: Column(
                      children: [
                        Text(
                          'Filter',
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Gender",
                          style: appstyle(20, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.black,
                                btn_name: "Men"),
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.grey,
                                btn_name: "Woman"),
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.grey,
                                btn_name: "Kids"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Category",
                          style: appstyle(20, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.black,
                                btn_name: "Shoes"),
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.grey,
                                btn_name: "Apparrels"),
                            Catagery_btn(
                                onPressed: () {},
                                btn_color: Colors.grey,
                                btn_name: "Accessori"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Price",
                          style: appstyle(20, Colors.black, FontWeight.w700),
                        ),
                        Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            thumbColor: Colors.black,
                            onChanged: (double value) {}),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Brand",
                          style: appstyle(40, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: mq.width * 0.17),
                          child: SizedBox(
                            height: 70,
                            width:
                                mq.width, // specify a height for the SizedBox
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: brand.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                      brand[index],
                                      width: 50,
                                      height: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
