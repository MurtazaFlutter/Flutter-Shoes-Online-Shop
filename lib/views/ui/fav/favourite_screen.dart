import 'package:hive/hive.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/ui/main_screen.dart';

import '../../../models/consts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _favBox = Hive.box("fav_box");

  _deleteFav(int key) async {
    await _favBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> fav = [];
    final favData = _favBox.keys.map(((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "price": item["price"],
        "imageUrl": item["imageUrl"]
      };
    })).toList();
    fav = favData.reversed.toList();
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/top_image.png",
                      ),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "My Favorites",
                  style: appStyle(40, Colors.white, FontWeight.bold, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                  itemCount: fav.length,
                  padding: const EdgeInsets.only(top: 100),
                  itemBuilder: ((context, index) {
                    final shoe = fav[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 5,
                                    blurRadius: 0.3,
                                    offset: const Offset(0, 1)),
                              ]),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: CachedNetworkImage(
                                      imageUrl: shoe['imageUrl'],
                                      width: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoe['name'],
                                          style: appStyle(16, Colors.black,
                                              FontWeight.bold, 1),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          shoe['category'],
                                          style: appStyle(14, Colors.grey,
                                              FontWeight.bold, 1),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${shoe['price']}",
                                              style: appStyle(18, Colors.black,
                                                  FontWeight.bold, 1),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: InkWell(
                                            onTap: () {
                                              _deleteFav(shoe['key']);
                                              ids.removeWhere(
                                                  (id) => id == shoe['id']);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          MainScreen())));
                                            },
                                            child: const Icon(
                                                Ionicons.md_heart_dislike),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
