import 'package:flutter/material.dart';

const BoxDecoration kFieldDecoration1 = BoxDecoration(
  color: Color(0XFFf96778),
  borderRadius: BorderRadius.all(
    Radius.circular(15.0),
  ),
);

const BoxDecoration kFieldDecoration2 = BoxDecoration(
  color: Color(0XFFfb9d86),
  borderRadius: BorderRadius.all(
    Radius.circular(15.0),
  ),
);

const Color kButtonColor = Color(0XFF2F3A3E);

const List<Color> kGradientColorList = [Color(0XFF00F0FF), Color(0XFF00C2FF)];

const List<Color> kGradientGreyList = [Colors.black38, Colors.black26];

const kTextStyleFields = TextStyle(fontSize: 17.0, color: Colors.white70);

const double kIconSize = 30;

//const kHintStyleFields = TextStyle(color: Colors.grey, fontSize: 14.0);

const kTextFieldBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
);

//////////////// here ends what's been coded by me

const kColorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const kColorGrey = Color.fromRGBO(141, 141, 141, 1.0);

const kColorWhite = Colors.white;
const kDarkBlue = Color.fromRGBO(20, 25, 45, 1.0);

const TextTheme kTextThemeDefault = TextTheme(
    headline1: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: kColorBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: kColorGrey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: kColorBlack, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: kColorGrey, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme kTextThemeSmall = TextTheme(
    headline1: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: kColorBlack, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: kColorBlack,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: kColorGrey,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: kColorBlack, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: kColorGrey, fontSize: 10, fontWeight: FontWeight.w400));
