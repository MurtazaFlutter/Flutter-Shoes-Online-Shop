import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_shop/controllers/product_notifier.dart';
import 'package:online_shop/utils/exports.dart';

import 'components/product_images.dart';

class ProductDetailPage extends StatefulWidget {
  final String category;
  final String id;
  const ProductDetailPage(
      {super.key, required this.category, required this.id});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();

  late Future<Sneakers> _sneakers;

  void getShoes() {
    if (widget.category == "Men's Running") {
      _sneakers = Helper().getMaleById(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneakers = Helper().getFemaleById(widget.id);
    } else {
      _sneakers = Helper().getKidsById(widget.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Sneakers>(
        future: _sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final sneaker = snapshot.data;

            return Consumer<ProductNotifier>(
                builder: (context, productNotifier, child) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                productNotifier.shoesSizes.clear();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(Ionicons.ellipsis_horizontal,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: true,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: ProductImages(
                                pageController: _pageController,
                                sneaker: sneaker,
                                productNotifier: productNotifier,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.645,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sneaker!.name,
                                          style: appStyle(20.sp, Colors.black,
                                              FontWeight.bold, 1),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              sneaker.category,
                                              style: appStyle(
                                                  20.sp,
                                                  Colors.grey,
                                                  FontWeight.w500,
                                                  1),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            RatingBar.builder(
                                              onRatingUpdate: (rating) {},
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 20,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              itemBuilder: (context, index) {
                                                return const Icon(Icons.star,
                                                    size: 18,
                                                    color: Colors.black);
                                              },
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$${sneaker.price}",
                                              style: appStyle(
                                                  26.sp,
                                                  Colors.black,
                                                  FontWeight.w600,
                                                  1),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Colors",
                                                  style: appStyle(
                                                      18.sp,
                                                      Colors.black,
                                                      FontWeight.w500,
                                                      1),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 5,
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 5,
                                                      backgroundColor:
                                                          Colors.red,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Select sizes",
                                                  style: appStyle(
                                                      20,
                                                      Colors.black,
                                                      FontWeight.w600,
                                                      1),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "View size guide",
                                                  style: appStyle(
                                                      20,
                                                      Colors.grey,
                                                      FontWeight.w600,
                                                      1),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                  itemCount: productNotifier
                                                      .shoesSizes.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      ((context, index) {
                                                    final sizes =
                                                        productNotifier
                                                            .shoesSizes[index];
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8.0),
                                                      child: ChoiceChip(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60)),
                                                        side: const BorderSide(
                                                            color: Colors.black,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid),
                                                        disabledColor:
                                                            Colors.white,
                                                        label: Text(
                                                          productNotifier
                                                                  .shoesSizes[
                                                              index]['size'],
                                                          style: appStyle(
                                                              18,
                                                              sizes['isSelected']
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              FontWeight.w500,
                                                              1),
                                                        ),
                                                        selectedColor:
                                                            Colors.black,
                                                        selected: productNotifier
                                                                    .shoesSizes[
                                                                index]
                                                            ['isSelected'],
                                                        onSelected: (newState) {
                                                          productNotifier
                                                              .toggleCheck(
                                                                  index);
                                                        },
                                                      ),
                                                    );
                                                  })),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              );
            });
          }
        },
      ),
    );
  }
}