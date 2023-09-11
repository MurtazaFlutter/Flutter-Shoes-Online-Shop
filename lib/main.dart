import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/controllers/main_screen_notifier.dart';
import 'package:online_shop/controllers/product_notifier.dart';
import 'package:provider/provider.dart';
import 'views/ui/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((context) => MainScreenNotifier()),
    ),
    ChangeNotifierProvider(
      create: ((context) => ProductNotifier()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: MainScreen(),
      ),
    );
  }
}
