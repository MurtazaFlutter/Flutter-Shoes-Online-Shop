import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/views/shared/app_style.dart';
import 'package:provider/provider.dart';
import '../../models/shoes_model.dart';
import 'latest_shoes.dart';
import 'product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('error ${snapshot.hasError}');
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        final male = snapshot.data![index];
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: appStyle(20.h, Colors.black, FontWeight.bold, 0),
                  ),
                  Row(
                    children: [
                      Text(
                        'See All',
                        style: appStyle(20.h, Colors.black, FontWeight.w500, 0),
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
          FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('error ${snapshot.hasError}');
              } else {
                final shoe = snapshot.data;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: shoe!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        final male = shoe[index];
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
    );
  }
}
