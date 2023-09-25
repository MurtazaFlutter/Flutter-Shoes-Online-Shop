import 'package:online_shop/models/sneaker_model.dart';

import '../../../utils/exports.dart';

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
