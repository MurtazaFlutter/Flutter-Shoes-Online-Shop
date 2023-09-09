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
                            height: MediaQuery.of(context).size.height,
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
                                        color: Colors.white,
                                        child: CachedNetworkImage(
                                          imageUrl: sneaker.imageUrl[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                          height: 20,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          right: 20,
                                          child: const Icon(
                                            AntDesign.hearto,
                                            color: Colors.grey,
                                          )),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                sneaker.imageUrl.length,
                                                (index) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        productNotifier
                                                                    .activePage !=
                                                                index
                                                            ? Colors.grey
                                                            : Colors.black,
                                                    radius: 5,
                                                  ),
                                                ),
                                              )))
                                    ],
                                  );
                                })),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
          }
        },
      ),
    );
  }
}
