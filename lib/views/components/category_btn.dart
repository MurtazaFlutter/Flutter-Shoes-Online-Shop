import 'package:online_shop/utils/exports.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color btnColor;
  const CategoryButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.225,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: btnColor,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label,
            style: appStyle(20, btnColor, FontWeight.w600, 1),
          ),
        ),
      ),
    );
  }
}
