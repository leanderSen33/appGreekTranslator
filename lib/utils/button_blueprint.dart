import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:greekfix/utils/constants.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.spread,
    required this.opacity,
    required this.isPushed,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  final double spread;
  final double opacity;
  final bool isPushed;
  final IconData icon;
  final List<Color> iconColor;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: kButtonColor,
      borderRadius: 35,
      height: 47,
      width: 47,
      depth: 35,
      spread: spread,
      emboss: isPushed,
      child: ShaderMask(
        shaderCallback: (bounds) => RadialGradient(
                center: Alignment.center, radius: 0.3, colors: iconColor)
            .createShader(bounds),
        child: Icon(
          icon,
          color: Colors.white.withOpacity(opacity),
          size: kIconSize,
        ),
      ),
    );
  }
}
