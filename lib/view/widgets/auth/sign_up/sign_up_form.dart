import 'package:flutter/material.dart';
import 'package:job_search/view/widgets/auth/sign_up/name_field.dart';
import 'package:nb_utils/nb_utils.dart';

import 'confirm_password.dart';
import 'email_textform.dart';
import 'password_textform.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ready to take the next step?", style: boldTextStyle(size: 18)),
          16.height,
          Text("Create an account and sign in.", style: secondaryTextStyle()),
          16.height,
          NameField(),
          16.height,
          Text("Email address *", style: boldTextStyle()),
          8.height,
          EmailTextform(),
          16.height,
          Text("Password *", style: boldTextStyle()),
          8.height,
          PasswordTextform(),
          Text("Confirm Password *", style: boldTextStyle()),
          8.height,
          ConfirmPasswordTextform(),
          // 16.height,
          // RichText(
          //   text: TextSpan(
          //     text:
          //         'When you create an account or sign in, you agree to Indeed\'s ',
          //     style: secondaryTextStyle(),
          //     children: <TextSpan>[
          //       TextSpan(
          //           text: 'Terms, ',
          //           style: boldTextStyle(
          //               color: JPColors.js_primaryColor,
          //               decoration: TextDecoration.underline)),
          //       TextSpan(
          //           text: 'Cookie ',
          //           style: boldTextStyle(
          //               color: JPColors.js_primaryColor,
          //               decoration: TextDecoration.underline)),
          //       TextSpan(text: 'and ', style: secondaryTextStyle()),
          //       TextSpan(
          //           text: 'privacy ',
          //           style: boldTextStyle(
          //               color: JPColors.js_primaryColor,
          //               decoration: TextDecoration.underline)),
          //       TextSpan(
          //           text: 'policies', style: secondaryTextStyle()),
          //       TextSpan(
          //           text:
          //               'you consent to receiving marketing massage from Indeed and may otp out of receiving such messages by following the unsubscribe link   in our messages, or '
          //               'as detailed  in out terms.',
          //           style: secondaryTextStyle()),
          //     ],
          //   ),
          // ),
          // 16.height,
        ],
      ),
    );
  }
}
