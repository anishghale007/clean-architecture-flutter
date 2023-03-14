import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../color_util.dart';

class TermsAndConditionTextWidget extends StatelessWidget {
  const TermsAndConditionTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By continuing, you agree to Arch Site’s ",
        style: const TextStyle(
          fontSize: 8.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "Terms of Use",
            style: TextStyle(
              color: ColorUtil.kPrimaryColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(
            text: " and confirm that you have read Arch Site’s ",
          ),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: ColorUtil.kPrimaryColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
