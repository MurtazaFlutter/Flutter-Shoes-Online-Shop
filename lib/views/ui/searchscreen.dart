import 'package:flutter/material.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/components/shared/custom_field.dart';
import 'package:online_shop/views/components/shared/reusable_text.dart';
import 'package:online_shop/views/ui/product_detail/product_detail_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  final shoe = snapshot.data;
                  return ListView.builder(itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: ((context) {
                        //   return ProductDetailPage(category: category, id: id)
                        // })));
                      },
                    );
                  }));
                }
              })),
    );
  }
}
