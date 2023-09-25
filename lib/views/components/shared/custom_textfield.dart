import '../../../utils/exports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboard,
    this.suffixIcon,
    this.obscureText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  // final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: TextFormField(
          keyboardType: keyboard,
          obscureText: obscureText ?? false,
          // initialValue: initialValue,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.black26,
              hintStyle: appStyle(14, Colors.grey, FontWeight.w500, 1),
              // contentPadding: EdgeInsets.only(left: 24),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              border: InputBorder.none),
          controller: controller,
          cursorHeight: 25,
          style: appStyle(14, Colors.black26, FontWeight.w500, 1),
          validator: validator),
    );
  }
}
