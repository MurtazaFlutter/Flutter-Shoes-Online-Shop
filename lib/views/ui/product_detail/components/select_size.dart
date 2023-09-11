import '../../../../controllers/product_notifier.dart';
import '../../../../utils/exports.dart';

class SelectSize extends StatelessWidget {
  final ProductNotifier productNotifier;
  const SelectSize({
    required this.productNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Select sizes",
              style: appStyle(20, Colors.black, FontWeight.w600, 1),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "View size guide",
              style: appStyle(20, Colors.grey, FontWeight.w600, 1),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
              itemCount: productNotifier.shoesSizes.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                final sizes = productNotifier.shoesSizes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    side: const BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    disabledColor: Colors.white,
                    label: Text(
                      productNotifier.shoesSizes[index]['size'],
                      style: appStyle(
                          18,
                          sizes['isSelected'] ? Colors.white : Colors.black,
                          FontWeight.w500,
                          1),
                    ),
                    selectedColor: Colors.black,
                    selected: productNotifier.shoesSizes[index]['isSelected'],
                    onSelected: (newState) {
                      productNotifier.toggleCheck(index);
                    },
                  ),
                );
              })),
        )
      ],
    );
  }
}
