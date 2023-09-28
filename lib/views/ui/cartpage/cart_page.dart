import 'package:hive/hive.dart';
import 'package:online_shop/controllers/cart_provider.dart';
import 'package:online_shop/models/cart/get_products.dart';
import 'package:online_shop/models/orders/orders_req.dart';
import 'package:online_shop/services/cart_helper.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_shop/views/components/shared/reusable_text.dart';
import 'package:online_shop/views/ui/main_screen.dart';
import 'package:online_shop/views/ui/product_detail/components/checkout_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> cart = [];

  late Future<List<Product>> _cartList;

  @override
  void initState() {
    super.initState();
    _cartList = CartHelper().getCart();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartNotifier>(context);
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
              child: FutureBuilder<List<Product>>(
                  future: _cartList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return Center(
                          child: ReusableText(
                              text: "No Items in the Cart yet",
                              style: appStyle(
                                  40.sp, Colors.black, FontWeight.bold, 1)));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: ReusableText(
                              text: "Failed to get cart data ${snapshot.error}",
                              style: appStyle(
                                  40.sp, Colors.black, FontWeight.bold, 1)));
                    } else {
                      final cartData = snapshot.data;
                      return ListView.builder(
                          itemCount: cartData!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: ((context, index) {
                            final data = cartData[index];

                            return InkWell(
                              onTap: () {
                                cartProvider.setProductIndex = index;
                                cartProvider.checkout.insert(0, data);
                              },
                              child: Padding(
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
                                                backgroundColor:
                                                    const Color(0xff000000),
                                                flex: 1,
                                                onPressed: ((context) {}))
                                          ]),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.11,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: CachedNetworkImage(
                                                    imageUrl: data
                                                        .cartItem.imageUrl[0],
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: -2,
                                                    child: InkWell(
                                                        onTap: () async {
                                                      await CartHelper()
                                                          .deleteItem(data.id)
                                                          .then((response) {
                                                        if (response == true) {
                                                          Navigator.push(
                                                              context,
                                                              (MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          MainScreen()))));
                                                        } else {
                                                          print(
                                                              "Failed to delete");
                                                        }
                                                      });
                                                    })),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12, left: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        data.cartItem.name,
                                                        style: appStyle(
                                                            16,
                                                            Colors.black,
                                                            FontWeight.bold,
                                                            1),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        data.cartItem.category,
                                                        style: appStyle(
                                                            16,
                                                            Colors.grey,
                                                            FontWeight.bold,
                                                            1),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            data.cartItem.price,
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
                                                          // Text(
                                                          //   "${data['sizes']}",
                                                          //   style: appStyle(
                                                          //       16,
                                                          //       Colors.grey,
                                                          //       FontWeight.bold,
                                                          //       1),
                                                          // ),
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            AntDesign
                                                                .minussquare,
                                                            size: 20,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        // Text(
                                                        //   data.quantity
                                                        //       .toString(),
                                                        //   style: appStyle(
                                                        //       16,
                                                        //       Colors.black,
                                                        //       FontWeight.bold,
                                                        //       1),
                                                        // ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: const Icon(
                                                            AntDesign
                                                                .plussquare,
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
                              ),
                            );
                          }));
                    }
                  }),
            ),
            cartProvider.checkout.isNotEmpty
                ? CheckOutButton(
                    label: "Proceed to Checkout",
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? userId = prefs.getString("userId") ?? "";
                      Order order = Order(userId: userId, cartItems: [
                        CartItem(
                            name: cartProvider.checkout[0].cartItem.name,
                            id: cartProvider.checkout[0].cartItem.id,
                            price: cartProvider.checkout[0].cartItem.price,
                            cartQuantity: 1)
                      ]);
                    })
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
