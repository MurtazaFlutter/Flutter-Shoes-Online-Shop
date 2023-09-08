import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../../controllers/main_screen_notifier.dart';
import 'bottom_nav_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarIcons(
                onTap: () {
                  mainScreenNotifier.pageIndex = 0;
                },
                iconData: mainScreenNotifier.pageIndex == 0
                    ? MaterialCommunityIcons.home
                    : MaterialCommunityIcons.home_outline,
              ),
              BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  iconData: mainScreenNotifier.pageIndex == 1
                      ? Ionicons.search
                      : Ionicons.search_outline

                  // iconData: Ionicons.search,
                  ),
              BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  iconData: mainScreenNotifier.pageIndex == 2
                      ? Ionicons.add
                      : Ionicons.add_circle_outline),
              BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  iconData: mainScreenNotifier.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline),
              BottomNavBarIcons(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                  },
                  iconData: mainScreenNotifier.pageIndex == 4
                      ? Ionicons.person
                      : Ionicons.person_outline),
            ],
          ),
        ),
      );
    });
  }
}
