import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/logic/change_notifier.dart';
import 'package:greekfix/utils/greek_fix_icons.dart';
import 'package:provider/provider.dart';
import 'package:greekfix/utils/constants.dart';
import 'package:greekfix/utils/button_blueprint.dart';

class ButtonPaste extends StatelessWidget {
  final AnimationController animationControllerSpread;
  final AnimationController animationControllerOpacity;
  ButtonPaste(this.animationControllerSpread, this.animationControllerOpacity);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: Provider.of<Data>(context, listen: false).pasteButtonIsPushed,
      child: GestureDetector(
        onTap: () {
          Provider.of<Data>(context, listen: false).clipboardPasteText();
          animationControllerSpread.forward();
          animationControllerOpacity.forward();
        },
        child: Buttons(
          iconColor: Provider.of<Data>(context, listen: false).pasteIconStatus,
          spread: 3.0,
          opacity: 1.0,
          isPushed:
              Provider.of<Data>(context, listen: false).pasteButtonIsPushed,
          icon: GreekFixIcons.pasteicon,
        ),
      ),
    );
  }
}

class ButtonVisualizeColors extends StatelessWidget {
  final double spread;
  final double opacity;
  final AnimationController animationControllerSpread;
  final AnimationController animationControllerOpacity;
  ButtonVisualizeColors(this.spread, this.opacity,
      this.animationControllerOpacity, this.animationControllerSpread);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring:
          Provider.of<Data>(context, listen: false).visualizeButtonIsDisabled,
      child: GestureDetector(
        onTap: () {
          Provider.of<Data>(context, listen: false).visualizeButton();

          animationControllerSpread.forward();
          animationControllerOpacity.forward();
        },
        child: Buttons(
          iconColor:
              Provider.of<Data>(context, listen: false).visualizeIconStatus,
          spread: spread,
          opacity: opacity,
          isPushed:
              Provider.of<Data>(context, listen: false).visualizeButtonIsPushed,
          icon: GreekFixIcons.visualizeicon,
        ),
      ),
    );
  }
}

class ButtonDelete extends StatelessWidget {
  final AnimationController animationControllerSpread;
  final AnimationController animationControllerOpacity;
  final AnimationController animationControllerLowerSpread;
  final AnimationController animationControllerLowerOpacity;

  final double spread;
  final double opacity;
  ButtonDelete(
      this.spread,
      this.opacity,
      this.animationControllerSpread,
      this.animationControllerOpacity,
      this.animationControllerLowerOpacity,
      this.animationControllerLowerSpread);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring:
          Provider.of<Data>(context, listen: false).deleteButtonIsDisabled,
      child: GestureDetector(
        onTap: () {
          Provider.of<Data>(context, listen: false).deleteButtonIsDisabled =
              true;
          Provider.of<Data>(context, listen: false).visualizeButtonIsDisabled =
              true;
          Provider.of<Data>(context, listen: false).clipboardDeleteText();

          Provider.of<Data>(context, listen: false).pasteIconStatus =
              kGradientColorList;

          animationControllerSpread.reverse();
          animationControllerOpacity.reverse();
          animationControllerLowerSpread.reverse();
          animationControllerLowerOpacity.reverse();

          if (Provider.of<Data>(context, listen: false).fixButtonIsPushed) {
            Provider.of<Data>(context, listen: false).fixButtonIsPushed = false;
          }

          if (Provider.of<Data>(context, listen: false)
              .switchCaseButtonIsPushed) {
            Provider.of<Data>(context, listen: false).switchCaseButtonIsPushed =
                false;
          }
        },
        child: Buttons(
          iconColor: kGradientColorList,
          spread: spread,
          opacity: opacity,
          isPushed:
              Provider.of<Data>(context, listen: false).deleteButtonIsPushed,
          icon: GreekFixIcons.deleteicon,
        ),
      ),
    );
  }
}

class ButtonFixText extends StatelessWidget {
  final double spread;
  final double opacity;
  ButtonFixText(this.spread, this.opacity);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: Provider.of<Data>(context, listen: false).fixButtonIsDisabled,
      child: GestureDetector(
        onTap: () {
          Provider.of<Data>(context, listen: false).fixButton();
          Provider.of<Data>(context, listen: false).fixButtonIsDisabled = true;
        },
        child: Buttons(
          iconColor: Provider.of<Data>(context, listen: false).fixIconStatus,
          spread: spread,
          opacity: opacity,
          isPushed: Provider.of<Data>(context, listen: false).fixButtonIsPushed,
          icon: GreekFixIcons.fixicon,
        ),
      ),
    );
  }
}

class ButtonSwitchCase extends StatelessWidget {
  final double spread;
  final double opacity;
  ButtonSwitchCase(this.spread, this.opacity);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring:
          Provider.of<Data>(context, listen: false).switchCaseButtonIsDisabled,
      child: GestureDetector(
        onTap: () {
          Provider.of<Data>(context, listen: false).switchCaseButton();
        },
        child: Buttons(
          iconColor:
              Provider.of<Data>(context, listen: false).switchCaseIconStatus,
          spread: spread,
          opacity: opacity,
          isPushed: Provider.of<Data>(context, listen: false)
              .switchCaseButtonIsPushed,
          icon: GreekFixIcons.caseicon,
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
      child: Buttons(
        iconColor: kGradientColorList,
        spread: 3,
        opacity: 1.0,
        isPushed: Provider.of<Data>(context, listen: false).copyButtonIsPushed,
        icon: GreekFixIcons.copyicon,
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
      child: Buttons(
        iconColor: kGradientColorList,
        spread: 3,
        opacity: 1.0,
        isPushed:
            Provider.of<Data>(context, listen: false).translateButtonIsPushed,
        icon: GreekFixIcons.translateicon,
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
      child: Buttons(
        iconColor: kGradientColorList,
        spread: 3,
        opacity: 1.0,
        isPushed:
            Provider.of<Data>(context, listen: false).returnButtonIsPushed,
        icon: GreekFixIcons.returnicon,
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
