import 'package:online_shop/models/sneaker_model.dart';
import '../../utils/exports.dart';
import 'filter_screen.dart';

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
    _male = ProductHelper().getMaleSneakers();
  }

  void getFemale() {
    _female = ProductHelper().getFemaleSneakers();
  }

  void getKids() {
    _kids = ProductHelper().getKidsShoes();
  }

  @override
  void initState() {
    super.initState();
    _tabController.index = widget.tabIndex;
    getMale();
    getFemale();
    getKids();
  }

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
                            filter(context);
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
                  LatestShoes(sneakers: _male),
                  LatestShoes(sneakers: _female),
                  LatestShoes(sneakers: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
