import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:greekfix/layouts/screensLayout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD4D7D9),
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Image.asset('assets/Images/greekFixTitle.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 2.5,
                        height: 1.5,
                        color: Color(0XFF617073),
                      ),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Correct and translate your greek text messages',
                              speed: Duration(milliseconds: 50),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 35.0),
                child: Image.asset(
                  'assets/Images/iconImage.png',
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Data>(context, listen: false).pressGetStarted();
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return ScreensLayout();
                        },
                        transitionDuration: Duration(milliseconds: 1000),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return Align(
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: ClayContainer(
                    color: Color(0XFFD4D7D9),
                    borderRadius: 50,
                    height: 67,
                    width: 260,
                    depth: 60,
                    spread: 8,
                    emboss: Provider.of<Data>(context).getStartedButtonIsPushed,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'GET STARTED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
