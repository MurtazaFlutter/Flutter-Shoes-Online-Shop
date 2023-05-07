import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LatestShoes extends StatelessWidget {
  final String imageUrl;
  const LatestShoes({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: CachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}
