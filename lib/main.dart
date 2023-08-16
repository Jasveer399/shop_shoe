import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoe/controller/cart_controller.dart';
import 'package:shop_shoe/controller/favorites_controller.dart';
import 'package:shop_shoe/controller/mainpage_controller.dart';
import 'package:shop_shoe/controller/product_provider.dart';
import 'package:shop_shoe/views/pages/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("cart_box");
  await Hive.openBox("fav_box");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainPageNotifier()),
      ChangeNotifierProvider(create: (context) => ProductNotifier()),
      ChangeNotifierProvider(create: (context) => FavoriteNotifier()),
      ChangeNotifierProvider(create: (context)=>CartNotifier()),
    ],
    child: const MyApp(),
  ));
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoe Shop',
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: Main_page());
  }
}
