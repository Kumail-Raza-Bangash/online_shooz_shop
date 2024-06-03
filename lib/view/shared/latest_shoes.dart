import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_shooz_shop/models/sneaker_model.dart';
import 'package:online_shooz_shop/view/shared/stagger_tile.dart';

// ignore: camel_case_types
class latestShoes extends StatelessWidget {
  const latestShoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final male = snapshot.data;
          return MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: male!.length,
            itemBuilder: (context, index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                  imageUrl: shoe.imageUrl[1],
                  name: shoe.name,
                  price: "\$${shoe.price}");
            },

            //
            // staggeredTileBuilder: (index) => StaggeredTile.extent(
            //   (index % 2 == 0) ? 1 : 1,
            //   (index % 4 == 1 || index % 4 == 3)
            //       ? MediaQuery.of(context).size.height * 0.35
            //       : MediaQuery.of(context).size.height * 0.3,
            // ),
            //
          );
        }
      },
    );
  }
}
