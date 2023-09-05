import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/views/shared/app_style.dart';
import 'package:provider/provider.dart';
import '../../models/shoes_model.dart';

class StaggeredTileWidget extends StatefulWidget {
  const StaggeredTileWidget({super.key});

  @override
  State<StaggeredTileWidget> createState() => _StaggeredTileState();
}

class _StaggeredTileState extends State<StaggeredTileWidget> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Sneakers>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl[0],
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 73,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: appStyle(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    "\$${product.price}",
                    style: appStyle(20, Colors.black, FontWeight.w700, 1),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
