import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/shoes_model.dart';

class StaggeredTile extends StatefulWidget {
  const StaggeredTile({super.key});

  @override
  State<StaggeredTile> createState() => _StaggeredTileState();
}

class _StaggeredTileState extends State<StaggeredTile> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Sneakers>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.sp)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl[0],
              fit: BoxFit.fill,
            ),
            
          ],
        ),
      ),
    );
  }
}
