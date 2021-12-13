import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/layouts/input_layout.dart';
import 'package:greekfix/layouts/color_layout.dart';
import 'package:greekfix/utils/buttons.dart';
// import 'package:greekfix/logic/change_notifier.dart';
// import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    required Key key,
    required this.orientation,
    required this.boxSide,
  }) : super(key: key);

  final Orientation orientation;
  final double boxSide;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  // Animation Controllers for the buttons of the first and second row.
  late AnimationController controllerSpreadUpperButtons;
  late AnimationController controllerOpacityUpperButtons;

  late AnimationController controllerSpreadLowerButtons;
  late AnimationController controllerOpacityLowerButtons;

  @override
  void dispose() {
    controllerSpreadUpperButtons.dispose();
    controllerOpacityUpperButtons.dispose();
    controllerSpreadLowerButtons.dispose();
    controllerOpacityLowerButtons.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controllerSpreadUpperButtons = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
      lowerBound: 0.7,
      upperBound: 3.0,
    );

    controllerOpacityUpperButtons = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      upperBound: 1.0,
    );

    controllerSpreadLowerButtons = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
      lowerBound: 0.7,
      upperBound: 3.0,
    );

    controllerOpacityLowerButtons = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      upperBound: 1.0,
    );

    super.initState();

    controllerSpreadUpperButtons.addListener(() {
      setState(() {});
    });

    controllerOpacityUpperButtons.addListener(() {
      setState(() {});
    });

    controllerSpreadLowerButtons.addListener(() {
      setState(() {});
    });

    controllerOpacityLowerButtons.addListener(() {
      setState(() {});
    });
  }

  // @override
  // bool get wantKeepAlive => Provider.of<Data>(context, listen: false).keptAlive;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Builder(
      builder: (context) {
        if (widget.orientation.index == Orientation.landscape.index)
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: layoutFirstScreenLandscape(
                  boxSide: widget.boxSide,
                  orientation: widget.orientation,
                  opacityLower: controllerOpacityLowerButtons,
                  spreadLower: controllerSpreadLowerButtons,
                  animationSpread: controllerSpreadUpperButtons,
                  animationOpacity: controllerOpacityUpperButtons),
            ),
          );
        else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: layoutFirstScreenPortrait(
                boxSide: widget.boxSide,
                orientation: widget.orientation,
                opacityLower: controllerOpacityLowerButtons,
                spreadLower: controllerSpreadLowerButtons,
                animationOpacity: controllerOpacityUpperButtons,
                animationSpread: controllerSpreadUpperButtons),
          );
        }
      },
    );
  }
}

List<Widget> layoutFirstScreenPortrait(
    {boxSide,
    orientation,
    animationOpacity,
    animationSpread,
    spreadLower,
    opacityLower}) {
  return [
    SizedBox(height: 40),
    Expanded(
      flex: 7,
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
            ButtonVisualizeColors(animationSpread.value, animationOpacity.value,
                opacityLower, spreadLower),
            SizedBox(
              height: 10,
              width: 20,
            ),
            ButtonPaste(animationSpread, animationOpacity),
            SizedBox(
              height: 10,
              width: 20,
            ),
            ButtonDelete(animationSpread.value, animationOpacity.value,
                animationSpread, animationOpacity, opacityLower, spreadLower),
          ],
        ),
      ),
    ),
    Expanded(
      flex: 7,
      child: ColorLayout(boxSide, orientation),
    ),
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSwitchCase(spreadLower.value, opacityLower.value),
            SizedBox(
              width: 20,
            ),
            ButtonFixText(spreadLower.value, opacityLower.value),
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
    animationSpread,
    animationOpacity,
    spreadLower,
    opacityLower}) {
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
          ButtonDelete(animationSpread.value, animationOpacity.value,
              animationSpread, animationOpacity, opacityLower, spreadLower),
          SizedBox(
            height: 40,
          ),
          ButtonPaste(animationSpread, animationOpacity),
          SizedBox(
            height: 40,
          ),
          ButtonVisualizeColors(animationSpread.value, animationOpacity.value,
              opacityLower, spreadLower),
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
          ButtonSwitchCase(opacityLower.value, spreadLower.value),
          SizedBox(
            height: 40,
          ),
          ButtonFixText(opacityLower.value, spreadLower.value),
        ],
      ),
    ),
    SizedBox(width: 10),
  ];
}
