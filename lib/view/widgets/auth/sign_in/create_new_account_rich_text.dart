import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/view/screens/auth/JSSignUpScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateNewAccountRichText extends StatelessWidget {
  const CreateNewAccountRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You do not have an account ? ',
        style: TextStyle(color: JPColors.appTextColorSecondary, fontSize: 12),
        children: <TextSpan>[
          TextSpan(
            text: 'Create a ',
          ),
          TextSpan(
            text: 'new account.',
            style: TextStyle(color: JPColors.js_secondaryColor, fontSize: 10),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                JSSignUpScreen().launch(context);
              },
          ),
        ],
      ),
    );
  }
}
