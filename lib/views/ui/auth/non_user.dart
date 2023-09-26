import 'package:flutter/material.dart';
import 'package:online_shop/utils/exports.dart';
import 'package:online_shop/views/components/shared/reusable_text.dart';
import 'package:online_shop/views/ui/auth/Login_screen.dart';
import 'package:svg_flutter/svg.dart';
import 'components/custom_app_bar.dart';

class NonUser extends StatelessWidget {
  const NonUser({super.key});

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
                            ReusableText(
                                text: "Hello, Please Login into Your Account",
                                style: appStyle(
                                    12.sp, Colors.grey, FontWeight.normal, 1)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: 50.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: ReusableText(
                                  text: "Login",
                                  style: appStyle(16.sp, Colors.white,
                                      FontWeight.normal, 1)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
