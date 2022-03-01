
import 'package:flutter/material.dart';
import 'package:prac28/core/constants/consts.dart';
import 'package:prac28/core/constants/font_const.dart';

class MyTextStyle {
  static get myAppBarTextStyle => TextStyle(
        color: ColorConst.kPrimaryColorDark,
        fontSize: FontConst.kMediumFont,
      );

  static get myListTileTitleTextStyle => TextStyle(
        color: Colors.black,
        fontSize: FontConst.kSmallFont,
      );
  static get myListTileSubtitleTextStyle => TextStyle(
        color: Colors.black,
        fontSize: FontConst.kExtraSmallFont,
        fontStyle: FontStyle.italic,
      );
}
