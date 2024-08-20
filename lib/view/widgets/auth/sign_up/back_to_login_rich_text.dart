import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/view/screens/auth/JOSignInScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class BackToLoginRichText extends StatelessWidget {
  const BackToLoginRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'I already have an account ',
        style: TextStyle(color: JPColors.appTextColorSecondary, fontSize: 12),
        children: <TextSpan>[
          TextSpan(
            text: 'Back to the ',
          ),
          TextSpan(
            text: 'login',
            style: TextStyle(color: JPColors.js_secondaryColor, fontSize: 10),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                JOSignInScreen().launch(context);
              },
          ),
        ],
      ),
    );
  }
}
