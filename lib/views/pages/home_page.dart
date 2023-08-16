import 'package:flutter/material.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/sneaker_models.dart';
import 'package:shop_shoe/services/helper.dart';
import 'package:shop_shoe/views/shared/appstyle.dart';
import 'package:shop_shoe/views/shared/bottonnav.dart';
import 'package:shop_shoe/views/shared/homewidget.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

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
    getfemaleShoe();
    getkidsShoe();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: mq.height,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 15, 0, 0),
                  height: mq.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/top_image.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, bottom: 15),
                    width: mq.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Athlwtice Shoes",
                          style: appstyle_WH(
                              40, Colors.white, FontWeight.bold, 1.5),
                        ),
                        Text(
                          "Collection",
                          style: appstyle_WH(
                              40, Colors.white, FontWeight.bold, 1.2),
                        ),
                        SizedBox(
                          height: mq.height * 0.02,
                        ),
                        TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                appstyle(20, Colors.white, FontWeight.bold),
                            unselectedLabelColor: Colors.grey.withOpacity(0.3),
                            tabs: [
                              Text("Men Shoes"),
                              Text("Women Shoes"),
                              Text("Kids Shoes"),
                            ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: mq.height * 0.25,
                      left: mq.width * 0.03,
                      right: mq.width * 0.03),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(
                      male: _male,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      male: _female,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      male: _kids,
                      tabIndex: 2,
                    )
                  ]),
                )
              ],
            )),
      ),
      //bottomNavigationBar: BottomNav_Bar(),
    );
  }
}
