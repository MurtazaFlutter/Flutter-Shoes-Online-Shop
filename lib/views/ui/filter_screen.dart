import '../../utils/exports.dart';
import '../components/category_btn.dart';
import '../components/shared/custom_spacer.dart';

List<String> brands = [
  'assets/images/adidas.png',
  'assets/images/gucci.png',
  'assets/images/jordan.png',
  'assets/images/nike.png',
];

Future<dynamic> filter(BuildContext context) {
  double value = 100;
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      context: context,
      builder: ((context) => Container(
            height: MediaQuery.of(context).size.height * 0.84,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      const CustomSpacer(),
                      Text(
                        "Filter",
                        style: appStyle(40, Colors.black, FontWeight.bold, 1),
                      ),
                      const CustomSpacer(),
                      Text(
                        "Gender",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CategoryButton(
                              onPressed: () {},
                              label: "Men",
                              btnColor: Colors.black),
                          CategoryButton(
                              onPressed: () {},
                              label: "Women",
                              btnColor: Colors.grey),
                          CategoryButton(
                              onPressed: () {},
                              label: "Kids",
                              btnColor: Colors.grey),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Category",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CategoryButton(
                              onPressed: () {},
                              label: "Shoes",
                              btnColor: Colors.black),
                          CategoryButton(
                              onPressed: () {},
                              label: "Apparel",
                              btnColor: Colors.grey),
                          CategoryButton(
                              onPressed: () {},
                              label: "Accessories",
                              btnColor: Colors.grey),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Price",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Slider(
                          thumbColor: Colors.black,
                          max: 500,
                          divisions: 50,
                          label: value.toString(),
                          secondaryTrackValue: 200,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          value: value,
                          onChanged: (double value) {}),
                      const CustomSpacer(),
                      Text(
                        "Brand",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 80,
                        child: ListView.builder(
                            itemCount: brands.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Image.asset(
                                    brands[index],
                                    height: 60,
                                    width: 80,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            })),
                      )
                      // const CategoryButton()
                    ],
                  ),
                )
              ],
            ),
          )));
}
