import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greekfix/logic/changeNotifier.dart';
import 'package:greekfix/utils/greekFixIcons.dart';
import 'package:provider/provider.dart';

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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: spread,
        emboss:
            Provider.of<Data>(context, listen: false).visualizeButtonIsPushed,
        child: Icon(
          GreekFixIcons.visualizeicon,
          color: Colors.blue.withOpacity(opacity),
          size: 37,
        ),
      ),
    );
  }
}

class ButtonPaste extends StatelessWidget {
  final AnimationController animationController;
  ButtonPaste(this.animationController);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).clipboardPasteText();
        if (animationController.isCompleted) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      },
      child: ClayContainer(
        color: Color(0XFFD4D7D9),
        //surfaceColor: Colors.orangeAccent,
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).pasteButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).pasteIconStatus}.png',
          ),
        ),
      ),
    );
  }
}

class ButtonDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Data>(context, listen: false).clipboardDeleteText();
      },
      child: ClayContainer(
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).deleteButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).deleteIconStatus}.png',
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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).fixButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).fixIconStatus}.png',
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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss:
            Provider.of<Data>(context, listen: false).switchCaseButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).switchCaseIconStatus}.png',
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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).copyButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).copyIconStatus}.png',
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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss:
            Provider.of<Data>(context, listen: false).translateButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).translateIconStatus}.png',
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
        color: Color(0XFFD4D7D9),
        borderRadius: 17,
        height: 50,
        width: 50,
        depth: 35,
        spread: 3,
        emboss: Provider.of<Data>(context, listen: false).returnButtonIsPushed,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Image.asset(
            'assets/Images/${Provider.of<Data>(context, listen: false).returnIconStatus}.png',
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
