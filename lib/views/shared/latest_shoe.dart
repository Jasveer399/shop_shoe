
import 'package:flutter/material.dart';
import 'package:shop_shoe/main.dart';
import 'package:shop_shoe/models/sneaker_models.dart';
import 'package:shop_shoe/views/shared/stageer_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class LatestShoe extends StatelessWidget {
  const LatestShoe({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: _male,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else {
            final male = snapshot.data!;
            return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                staggeredTileBuilder: (index) =>
                    StaggeredTile.extent(
                        (index % 2 == 0) ? 1 : 1,
                        (index % 4 == 1 || index % 4 == 3)
                            ? mq.height * 0.35
                            : mq.height * 0.3),
                scrollDirection: Axis.vertical,
                itemCount: male.length,
                itemBuilder: (context, index) {
                  final shoe = snapshot.data![index];
                  return Stagger_Tile(
                      image_url: shoe.imageUrl[1],
                      shoe_name: shoe.name,
                      shoe_price: shoe.price);
                });
          }
        });
  }
}