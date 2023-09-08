import 'package:flutter/material.dart';

class BottomNavBarIcons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  const BottomNavBarIcons({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
