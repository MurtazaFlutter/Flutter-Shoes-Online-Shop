import 'package:svg_flutter/svg.dart';
import '../../../../utils/exports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFE3E2E2),
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/usa.svg',
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 15.h,
                      width: 1.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ReusableText(
                        text: "USA",
                        style: appStyle(
                            16.sp, Colors.black, FontWeight.normal, 1)),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(
                        SimpleLineIcons.settings,
                        color: Colors.black,
                        size: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
