import 'package:flutter/material.dart';
import 'package:online_shop/controllers/main_screen_notifier.dart';
import 'package:online_shop/controllers/shoes_notifier.dart';
import 'package:provider/provider.dart';
import 'views/ui/main_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((context) => MainScreenNotifier()),
    ),
    ChangeNotifierProvider(
      create: ((context) => ShoesProvider()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
