import 'package:flutter/material.dart';
import 'dart:ui';
import 'utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:greekfix/screens/landingScreen.dart';
import 'package:greekfix/utils/size_config.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final double screenWidth = window.physicalSize
      .width; // -> dart:ui  // si hay problemas pasarla al metodo build.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) {
        return Data();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: LandingScreen(),
                title: 'GreekFix',
                theme: ThemeData(
                    primaryColor: kColorWhite,
                    accentColor: kDarkBlue,
                    scaffoldBackgroundColor: Color(
                        0XFF2F3A3E), // ==> body color for the scaffold (old: 0XFFD4D7D9)
                    fontFamily: "Montserrat"),
              );
            },
          );
        },
      ),
    );
  }
}
