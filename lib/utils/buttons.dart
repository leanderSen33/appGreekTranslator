import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:greekfix/utils/greekFixIcons.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/utils/constants.dart';

class ButtonVisualizeColors extends StatelessWidget {
  final double spread;
  final double opacity;
  ButtonVisualizeColors(this.spread, this.opacity);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).visualizeButton();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: spread,
        emboss:
            Provider.of<Data>(context, listen: false).visualizeButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00F0FF), Color(0XFF00C2FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.visualizeicon,
            color: Colors.white.withOpacity(opacity),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonPaste extends StatelessWidget {
  final AnimationController animationControllerSpread;
  final AnimationController animationControllerOpacity;
  ButtonPaste(this.animationControllerSpread, this.animationControllerOpacity);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).clipboardPasteText();
        if (animationControllerSpread.isCompleted) {
          animationControllerSpread.reverse();
          animationControllerOpacity.reverse();
        } else {
          animationControllerSpread.forward();
          animationControllerOpacity.forward();
        }
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        //surfaceColor: Colors.orangeAccent,
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).pasteButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[Color(0XFF00F0FF), Color(0XFF00C2FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.pasteicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonDelete extends StatelessWidget {
  final double spread;
  final double opacity;
  ButtonDelete(this.spread, this.opacity);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).clipboardDeleteText();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: spread,
        emboss: Provider.of<Data>(context, listen: false).deleteButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.centerRight,
                  radius: 0.9,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.deleteicon,
            color: Colors.white.withOpacity(opacity),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonFixText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).fixButton();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).fixButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.fixicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonSwitchCase extends StatelessWidget {
  //use this to make the button contour disappear.
  // final int depth;
  // ButtonSwitchCase(this.depth);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).switchCaseButton();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss:
            Provider.of<Data>(context, listen: false).switchCaseButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.caseicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).clipboardCopyText();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Text copied to clipboard'),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).copyButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.copyicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).translateButton();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss:
            Provider.of<Data>(context, listen: false).translateButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.translateicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

class ButtonRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).refreshButton();
      },
      child: ClayContainer(
        color: Color(0XFF2F3A3E),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).returnButtonIsPushed,
        child: ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
                  center: Alignment.center,
                  radius: 0.3,
                  colors: [Color(0XFF00C2FF), Color(0XFF00F0FF)])
              .createShader(bounds),
          child: Icon(
            GreekFixIcons.returnicon,
            color: Colors.white.withOpacity(1.0),
            size: kIconSize,
          ),
        ),
      ),
    );
  }
}

// class ButtonVisualizeColors extends StatelessWidget {
//   final double spread;
//   final double opacity;
//   ButtonVisualizeColors(this.spread, this.opacity);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Provider.of<Data>(context, listen: false).visualizeButton();
//       },
//       child: ClayContainer(
//         color: Color(0XFFD4D7D9),
//         borderRadius: 17,
//         height: 50,
//         width: 50,
//         depth: 35,
//         spread: spread,
//         emboss:
//         Provider.of<Data>(context, listen: false).visualizeButtonIsPushed,
//         child: IgnorePointer(
//           child: Container(
//             constraints: BoxConstraints(maxHeight: 30, maxWidth: 37),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   colorFilter: ColorFilter.mode(
//                       Color(0XFFD4D7D9).withOpacity(opacity),
//                       BlendMode.dstATop),
//                   image: AssetImage(
//                       'assets/Images/${Provider.of<Data>(context, listen: false).visualizeIconStatus}.png')),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
