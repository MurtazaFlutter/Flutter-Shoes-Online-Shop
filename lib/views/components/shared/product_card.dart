import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/utils/exports.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Sneakers>(context, listen: true);
    final fav = Provider.of<FavoriteNotifier>(context, listen: true);
    fav.getFavorites();
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 190.w,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: CachedNetworkImageProvider(
                              product.imageUrl[0],
                            ))),
                  ),
                  Positioned(
                      right: 12.w,
                      child: Consumer<FavoriteNotifier>(
                          builder: (context, fav, chld) {
                        return InkWell(
                          onTap: () async {
                            if (fav.ids.contains(product.id)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const FavoritesScreen())));
                            } else {
                              fav.createFav({
                                "id": product.id,
                                "name": product.name,
                                "category": product.category,
                                "price": product.price,
                                "image": product.imageUrl[0]
                              });
                            }
                            setState(() {});
                          },
                          child: fav.ids.contains(product.id)
                              ? const Icon(AntDesign.heart)
                              : const Icon(AntDesign.hearto),
                        );
                      })),
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
                      style: appStyle(21.sp, Colors.black, FontWeight.w600, 0),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
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
