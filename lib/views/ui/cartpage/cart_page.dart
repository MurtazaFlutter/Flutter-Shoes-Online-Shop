import 'package:flutter/material.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
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
                Text(
                  "My Cart",
                  style: appStyle(36, Colors.black, FontWeight.bold, 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.zero,
                      itemBuilder: ((context, index) {
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
                                          backgroundColor:
                                              const Color(0xff000000),
                                          flex: 1,
                                          onPressed: ((context) {}))
                                    ]),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
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
                                )),
                          ),
                        );
                      })),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
