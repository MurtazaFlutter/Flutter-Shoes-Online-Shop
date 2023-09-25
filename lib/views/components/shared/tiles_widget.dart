import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:svg_flutter/svg.dart';

class TilesWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Function()? onTap;

  const TilesWidget({
    Key? key,
    required this.title,
    required this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Icon(leading),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: title != "Settings"
            ? const Icon(
                AntDesign.right,
                size: 16,
              )
            : SvgPicture.asset(
                "assets/images/usa.svg",
                width: 15,
                height: 20,
              ));
  }
}
