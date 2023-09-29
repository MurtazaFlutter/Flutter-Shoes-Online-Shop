import 'utils/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => MainScreenNotifier())),
    ChangeNotifierProvider(create: ((context) => ProductNotifier())),
    ChangeNotifierProvider(create: ((context) => FavoriteNotifier())),
    ChangeNotifierProvider(create: ((context) => LoginNotifier())),
    ChangeNotifierProvider(create: ((context) => CartNotifier())),
    ChangeNotifierProvider(create: ((context) => PaymentNotifier())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(325, 825),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shop App',
        theme: ThemeData(
          // appBarTheme:
          //     const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
          useMaterial3: true,
          // scaffoldBackgroundColor: const Color(0xFFE3E2E2),
        ),
        home: MainScreen(),
      ),
    );
  }
}
