import 'package:online_shop/controllers/product_notifier.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/components/shared/custom_field.dart';
import 'package:online_shop/views/components/shared/reusable_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productNotifier = Provider.of<ProductNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: Colors.black,
        elevation: 0,
        title: CustomField(
            onEditingComplete: () {
              setState(() {});
            },
            prefixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(AntDesign.search1),
            ),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(AntDesign.camera),
            ),
            hintText: "Search for a product",
            controller: searchController),
      ),
      body: searchController.text.isEmpty
          ? Container(
              height: 600.h,
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.only(right: 50.w),
              child: Image.asset("assets/images/Pose23.png"),
            )
          : FutureBuilder(
              future: Helper().search(searchController.text),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasData) {
                  return Center(
                    child: ReusableText(
                        text: "Error Retriving the Data",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1)),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: ReusableText(
                        text: "Error Retriving the Data",
                        style: appStyle(20, Colors.black, FontWeight.bold, 1)),
                  );
                } else {
                  final shoes = snapshot.data;
                  return ListView.builder(
                      itemCount: shoes!.length,
                      itemBuilder: ((context, index) {
                        final shoe = shoes[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: ((context) {
                            //   return ProductDetailPage(category: category, id: id)
                            // })));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 100.h,
                                width: 325.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 0.3,
                                        spreadRadius: 5,
                                        offset: const Offset(0, 1),
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: CachedNetworkImage(
                                        imageUrl: shoe.imageUrl[0],
                                        height: 70.h,
                                        width: 70.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 12.h, left: 12.w),
                                      child: Column(
                                        children: [
                                          ReusableText(
                                              text: shoe.name,
                                              style: appStyle(
                                                  16.sp,
                                                  Colors.black,
                                                  FontWeight.w600,
                                                  1)),
                                          ReusableText(
                                              text: shoe.category,
                                              style: appStyle(
                                                  16.sp,
                                                  Colors.grey.shade600,
                                                  FontWeight.w600,
                                                  1)),
                                          ReusableText(
                                              text: "\$ ${shoe.name}",
                                              style: appStyle(
                                                  13.sp,
                                                  Colors.grey.shade600,
                                                  FontWeight.w600,
                                                  1)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }
              })),
    );
  }
}
