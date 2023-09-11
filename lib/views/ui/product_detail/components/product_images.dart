import '../../../../controllers/product_notifier.dart';
import '../../../../utils/exports.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required PageController pageController,
    required this.sneaker,
    required this.productNotifier,
  }) : _pageController = pageController;

  final PageController _pageController;
  final Sneakers? sneaker;
  final ProductNotifier productNotifier;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: sneaker!.imageUrl.length,
      onPageChanged: (page) {
        productNotifier.activePage = page;
      },
      itemBuilder: ((context, index) {
        return Stack(
          children: [
            Hero(
              tag: sneaker!.imageUrl[index],
              child: Container(
                height: MediaQuery.of(context).size.height * 0.39,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                child: CachedNetworkImage(
                  imageUrl: sneaker!.imageUrl[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              height: 20,
              top: MediaQuery.of(context).size.height * 0.1,
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
              height: MediaQuery.of(context).size.height * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  sneaker!.imageUrl.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: productNotifier.activePage != index
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
    );
  }
}
