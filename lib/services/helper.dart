import 'package:flutter/services.dart' as the_bundle;
import 'package:shop_shoe/models/sneaker_models.dart';

class Helper {
  //Male Shoe Data
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final malelist = sneakersFromJson(data);
    return malelist;
  }

//Female Shoe Data
  Future<List<Sneakers>> getfemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femalelist = sneakersFromJson(data);
    return femalelist;
  }

//Kids Shoe Data
  Future<List<Sneakers>> getKidsSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidslist = sneakersFromJson(data);
    return kidslist;
  }

  //Male Shoe id
  Future<Sneakers> getMaleSneakersid(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    final malelist = sneakersFromJson(data);
    final sneaker = malelist.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }

  //Female Shoe id
  Future<Sneakers> getfemaleSneakersid(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');

    final malelist = sneakersFromJson(data);
    final sneaker = malelist.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }

  //Kids Shoe id
  Future<Sneakers> getkidsSneakersid(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');

    final malelist = sneakersFromJson(data);
    final sneaker = malelist.firstWhere((sneakers) => sneakers.id == id);
    return sneaker;
  }
}
