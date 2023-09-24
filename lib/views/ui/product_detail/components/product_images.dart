import 'package:hive_flutter/hive_flutter.dart';

import '../../../../controllers/product_notifier.dart';
import '../../../../oldModel/consts.dart';
import '../../../../utils/exports.dart';
import '../../fav/favourite_screen.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required PageController pageController,
    required this.sneaker,
    required this.productNotifier,
  }) : _pageController = pageController;

  final PageController _pageController;
  final Sneakers? sneaker;
  final ProductNotifier productNotifier;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
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
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: widget._pageController,
      itemCount: widget.sneaker!.imageUrl.length,
      onPageChanged: (page) {
        widget.productNotifier.activePage = page;
      },
      itemBuilder: ((context, index) {
        return Stack(
          children: [
            Hero(
              tag: widget.sneaker!.imageUrl[index],
              child: Container(
                height: MediaQuery.of(context).size.height * 0.39,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                child: CachedNetworkImage(
                  imageUrl: widget.sneaker!.imageUrl[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
                height: 20,
                top: MediaQuery.of(context).size.height * 0.1,
                right: 20,
                child: InkWell(
                  onTap: () async {
                    if (ids.contains(widget.sneaker!.id)) {
                      //  print(" product id ${product.id}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const FavoritesScreen())));
                    } else {
                      _createFav({
                        "id": widget.sneaker!.id,
                        "name": widget.sneaker!.name,
                        "category": widget.sneaker!.category,
                        "price": widget.sneaker!.price,
                        "image": widget.sneaker!.imageUrl
                      });
                    }
                  },
                  child: ids.contains(widget.sneaker!.id)
                      ? const Icon(AntDesign.heart)
                      : const Icon(AntDesign.hearto),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  widget.sneaker!.imageUrl.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor:
                          widget.productNotifier.activePage != index
                              ? Colors.grey
                              : Colors.black,
                      radius: 5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
