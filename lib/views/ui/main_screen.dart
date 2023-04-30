import 'package:flutter/material.dart';
import 'package:online_shop/controllers/main_screen_notifier.dart';
import 'package:online_shop/views/ui/profile.dart';
import 'package:provider/provider.dart';
import '../shared/bottom_nav.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'searchscreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: const BottomBar(),
      );
    });
  }
}


