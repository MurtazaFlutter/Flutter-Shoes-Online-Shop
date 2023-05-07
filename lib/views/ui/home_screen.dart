import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../controllers/shoes_notifier.dart';
import '../shared/app_style.dart';
import '../shared/latest_shoes.dart';
import '../shared/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: 300.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/top_image.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 8.w, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Athletics Shoes Collection',
                        style: appStyle(
                          30.h,
                          Colors.white,
                          FontWeight.bold,
                          1.5,
                        ),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.black,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appStyle(20.w, Colors.white, FontWeight.bold, 0),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: 'Men Shoes',
                            ),
                            Tab(
                              text: 'Women Shoes',
                            ),
                            Tab(
                              text: 'Kids Shoes',
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.405,
                            child: FutureBuilder(
                              future: shoesProvider.loadMaleShoes(),
                              builder:
                                  ((context, AsyncSnapshot<void> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('error ${snapshot.hasError}');
                                } else {
                                  return ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: shoesProvider.shoes.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, int index) {
                                        final male = shoesProvider.shoes[index];
                                        return ChangeNotifierProvider.value(
                                          value: male,
                                          child: const ProductCard(),
                                        );
                                      }));
                                }
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Latest Shoes',
                                    style: appStyle(
                                        20.h, Colors.black, FontWeight.bold, 0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Latest Shoes',
                                        style: appStyle(20.h, Colors.black,
                                            FontWeight.w500, 0),
                                      ),
                                      Icon(
                                        AntDesign.caretright,
                                        size: 20.h,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          FutureBuilder(
                            future: shoesProvider.loadMaleShoes(),
                            builder: ((context, AsyncSnapshot<void> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('error ${snapshot.hasError}');
                              } else {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: shoesProvider.shoes.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        final male = shoesProvider.shoes[index];
                                        return LatestShoes(
                                          imageUrl: male.imageUrl[1],
                                        );
                                      })),
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.orange,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
