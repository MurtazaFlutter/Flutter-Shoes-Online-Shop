import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/ui/fav/favourite_screen.dart';

import '../../../models/consts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _favBox = Hive.box("fav_box");

  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorites();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);

      return {
        "key": key,
        "id": "id",
      };
    }).toList();

    favor = favData.toList();
    ids = favor.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Sneakers>(context);
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 220.w,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                product.imageUrl[0]))),
                  ),
                  Positioned(
                      top: 12.h,
                      right: 12.w,
                      child: InkWell(
                        onTap: () async {
                          if (ids.contains(product.id)) {
                            print(" product id ${product.id}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const FavoritesScreen())));
                          } else {
                            _createFav({
                              "id": product.id,
                              "name": product.name,
                              "category": product.category,
                              "price": product.price,
                              "image": product.imageUrl
                            });
                          }
                        },
                        child: ids.contains(product.id)
                            ? const Icon(AntDesign.heart)
                            : const Icon(AntDesign.hearto),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          appStyle(28.sp, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      product.category,
                      style: appStyle(12.sp, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: appStyle(25.sp, Colors.black, FontWeight.w600, 0),
                    ),
                    Row(
                      children: [
                        Text(
                          'Colors',
                          style:
                              appStyle(14.sp, Colors.grey, FontWeight.w500, 0),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        ChoiceChip(
                          label: const Text(''),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
