import 'package:hive/hive.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_shop/views/ui/product_detail/components/checkout_btn.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final _cartBox = Hive.box("cart_box");

  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];
    final cartData = _cartBox.keys.map(
      (key) {
        final item = _cartBox.get(key);
        return {
          "key": key,
          "id": item['id'],
          "category": item['category'],
          "name": item['name'],
          "imageUrl": item["imageUrl"],
          "price": item["price"],
          "qty": item["qty"],
          "sizes": item["sizes"]
        };
      },
    ).toList();

    cart = cartData.reversed.toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                AntDesign.close,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "My Cart",
              style: appStyle(36, Colors.black, FontWeight.bold, 1),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: ((context, index) {
                    final data = cart[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: "Delete",
                                      backgroundColor: const Color(0xff000000),
                                      flex: 1,
                                      onPressed: ((context) {}))
                                ]),
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
                                        offset: const Offset(0, 1))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: CachedNetworkImage(
                                          imageUrl: data['imageUrl'],
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data["name"],
                                              style: appStyle(16, Colors.black,
                                                  FontWeight.bold, 1),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              data["category"],
                                              style: appStyle(16, Colors.grey,
                                                  FontWeight.bold, 1),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  data["price"],
                                                  style: appStyle(
                                                      16,
                                                      Colors.black,
                                                      FontWeight.bold,
                                                      1),
                                                ),
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                Text(
                                                  "Size",
                                                  style: appStyle(
                                                      16,
                                                      Colors.grey,
                                                      FontWeight.bold,
                                                      1),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  data["sizes"].toString(),
                                                  style: appStyle(
                                                      16,
                                                      Colors.grey,
                                                      FontWeight.bold,
                                                      1),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: const Icon(
                                                  AntDesign.minussquare,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                data["qty"].toString(),
                                                style: appStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.bold,
                                                    1),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: const Icon(
                                                  AntDesign.plussquare,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  })),
            ),
            CheckOutButton(label: "Proceed to Checkout", onTap: () {})
          ],
        ),
      ),
    );
  }
}
