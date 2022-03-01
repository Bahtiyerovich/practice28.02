import 'package:flutter/material.dart';
import 'package:prac28/core/constants/consts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color? color;
  final Color? textColor;

  const MyAppBar({Key? key, this.title, this.textColor, this.color})
      : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? ColorConst.kPrimaryWhite,
      iconTheme: IconThemeData(
        color: textColor ?? ColorConst.kPrimaryBlack,
      ),
      elevation: 0,
      title: Text(
        title ?? '',
        style: TextStyle(
          color: textColor ?? ColorConst.kPrimaryBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
