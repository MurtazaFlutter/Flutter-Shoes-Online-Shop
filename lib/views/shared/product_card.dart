import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../models/shoes_model.dart';
import 'app_style.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  // final String price;
  // final String category;
  // final String id;
  // final String name;
  // final String image;
  // const ProductCard(
  //     {super.key,
  //     required this.price,
  //     required this.category,
  //     required this.id,
  //     required this.name,
  //     required this.image});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
                            image: NetworkImage(product.imageUrl[0]))),
                  ),
                  Positioned(
                      top: 12.h,
                      right: 12.w,
                      child: const InkWell(
                        onTap: null,
                        child: Icon(MaterialCommunityIcons.heart_outline),
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
                      style: appStyle(28.h, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      product.category,
                      style: appStyle(12.h, Colors.grey, FontWeight.bold, 1.5),
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
                      style: appStyle(25.h, Colors.black, FontWeight.w600, 0),
                    ),
                    Row(
                      children: [
                        Text(
                          'Colors',
                          style:
                              appStyle(14.h, Colors.grey, FontWeight.w500, 0),
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
