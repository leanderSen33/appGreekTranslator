import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:greekfix/screens/first_screen.dart';
import 'package:greekfix/screens/second_screen.dart';
import 'package:greekfix/logic/change_notifier.dart';
import 'package:provider/provider.dart';

class ScreensLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controllerPage = Provider.of<Data>(context).controllerPage;
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double boxSide = size.shortestSide - 100;

    Axis scrollDirection() {
      if (orientation.index == Orientation.landscape.index) {
        return Axis.horizontal;
      } else {
        return Axis.vertical;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: PageView(
          controller: controllerPage,
          scrollDirection: scrollDirection(),
          pageSnapping: Provider.of<Data>(context).pageSnappingChange,
          children: [
            FirstScreen(
                key: PageStorageKey('hola'),
                orientation: orientation,
                boxSide: boxSide),
            SecondScreen(
                key: PageStorageKey('holo'),
                orientation: orientation,
                boxSide: boxSide),
          ],
        ),
      ),
    );
  }
}
