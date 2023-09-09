import '../../utils/exports.dart';
import '../components/category_btn.dart';
import '../components/shared/custom_spacer.dart';

class ProductByCategory extends StatefulWidget {
  final int tabIndex;
  const ProductByCategory({super.key, required this.tabIndex});

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsShoes();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  List<String> brands = [
    'assets/images/adidas.png',
    'assets/images/gucci.png',
    'assets/images/jordan.png',
    'assets/images/nike.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 300.h,
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
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
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.21,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(controller: _tabController, children: [
                  //const StaggeredTile(),
                  LatestShoes(male: _male),
                  LatestShoes(male: _female),
                  LatestShoes(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
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
}
