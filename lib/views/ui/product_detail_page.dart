import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_shop/controllers/product_notifier.dart';
import 'package:online_shop/utils/exports.dart';

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
                              onTap: () {},
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
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                itemCount: sneaker!.imageUrl.length,
                                onPageChanged: (page) {
                                  productNotifier.activePage = page;
                                },
                                itemBuilder: ((context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.39,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey.shade300,
                                        child: CachedNetworkImage(
                                          imageUrl: sneaker.imageUrl[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        height: 20,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        right: 20,
                                        child: const Icon(
                                          AntDesign.hearto,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List<Widget>.generate(
                                            sneaker.imageUrl.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: CircleAvatar(
                                                backgroundColor: productNotifier
                                                            .activePage !=
                                                        index
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
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
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
                                          sneaker.name,
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
                                              ],
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
