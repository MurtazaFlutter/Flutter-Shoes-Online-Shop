import 'package:flutter/material.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/components/shared/reusable_text.dart';
import 'package:online_shop/views/components/shared/tiles_widget.dart';
import 'package:online_shop/views/ui/auth/Login_screen.dart';
import 'package:online_shop/views/ui/fav/favourite_screen.dart';
import '../components/shared/app_style.dart';
import 'auth/components/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 750.h,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/user.jpeg'),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                    text: "Username",
                                    style: appStyle(12.sp, Colors.grey,
                                        FontWeight.normal, 1)),
                                ReusableText(
                                    text: "example@gmail.com",
                                    style: appStyle(12.sp, Colors.grey,
                                        FontWeight.normal, 1)),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Feather.edit,
                              size: 18,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 180.h,
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TilesWidget(
                              title: "My Orders",
                              leading:
                                  MaterialCommunityIcons.truck_fast_outline,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginScreen()))));
                              },
                            ),
                            TilesWidget(
                              title: "My Favorites",
                              leading: MaterialCommunityIcons.heart_outline,
                              onTap: () {},
                            ),
                            TilesWidget(
                              title: "Cart",
                              leading: Fontisto.shopping_bag_1,
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 120.h,
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TilesWidget(
                              title: "Coupons",
                              leading: MaterialCommunityIcons.tag_outline,
                              onTap: () {},
                            ),
                            TilesWidget(
                              title: "My Store",
                              leading: MaterialCommunityIcons.shopping_outline,
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 180.h,
                        color: Colors.grey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TilesWidget(
                              title: "Shopping addresses",
                              leading: SimpleLineIcons.location_pin,
                              onTap: () {},
                            ),
                            TilesWidget(
                              title: "Settings",
                              leading: AntDesign.setting,
                              onTap: () {},
                            ),
                            TilesWidget(
                              title: "Logout",
                              leading: AntDesign.logout,
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
