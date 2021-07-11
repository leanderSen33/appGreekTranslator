import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/layouts/inputLayout.dart';
import 'package:greekfix/layouts/colorLayout.dart';
import 'package:greekfix/utils/buttons.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    required this.orientation,
    required this.boxSide,
  });

  final Orientation orientation;
  final double boxSide;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  // double getRadiansFromDegree(double degree) {
  //   double unitRadian = 57.295779513;
  //   return degree / unitRadian;
  // }

  late Animation degOneTranslationAnimation;
  late AnimationController controller;
  late AnimationController controller2;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      upperBound: 4.0,
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      upperBound: 1.0,
    );

    controller.forward();
    controller2.forward();

    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(controller);
    super.initState();

    controller.addListener(() {
      setState(() {});
    });

    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.orientation.index == Orientation.landscape.index)
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: layoutFirstScreenLandscape(
                  boxSide: widget.boxSide,
                  orientation: widget.orientation,
                  degAnimation: degOneTranslationAnimation,
                  // getRadiansFromDegree: getRadiansFromDegree,
                  animation: controller,
                  animation2: controller2),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutFirstScreenPortrait(
                boxSide: widget.boxSide,
                orientation: widget.orientation,
                degAnimation: degOneTranslationAnimation,
                // getRadiansFromDegree: getRadiansFromDegree,
                animation2: controller2,
                animation: controller),
          );
        }
      },
    );
  }
}

List<Widget> layoutFirstScreenPortrait(
    {boxSide,
    orientation,
    degAnimation,
    getRadiansFromDegree,
    animation,
    animation2}) {
  return [
    Expanded(
      child: SizedBox(height: 40),
    ),
    Expanded(
      flex: 6,
      child: InputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IgnorePointer is the solution for the non responding buttons.
            ButtonVisualizeColors(animation.value, animation2.value),
            SizedBox(
              height: 10,
              width: 20,
            ),
            ButtonPaste(animation),
            SizedBox(
              height: 10,
              width: 20,
            ),
            ButtonDelete(),
          ],
        ),
      ),
    ),
    Expanded(
      flex: 6,
      child: ColorLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSwitchCase(),
            SizedBox(
              width: 20,
            ),
            ButtonFixText(),
          ],
        ),
      ),
    ),
    SizedBox(height: 20),
  ];
}

List<Widget> layoutFirstScreenLandscape(
    {boxSide,
    orientation,
    degAnimation,
    getRadiansFromDegree,
    animation,
    animation2}) {
  return [
    //SizedBox(width: 10),
    SizedBox(width: 17),
    Expanded(
      flex: 6,
      child: InputLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonPaste(animation),
          SizedBox(
            height: 40,
          ),
          ButtonVisualizeColors(animation.value, animation2.value),
          SizedBox(
            height: 40,
          ),
          ButtonDelete(),
        ],
      ),
    ),
    Expanded(
      flex: 6,
      child: ColorLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonSwitchCase(),
          SizedBox(
            height: 40,
          ),
          ButtonFixText(),
        ],
      ),
    ),
    SizedBox(width: 10),
  ];
}
