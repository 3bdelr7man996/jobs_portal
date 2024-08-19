import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/provider/sign_up_provider.dart';
import 'package:job_search/view/screens/JSJobSearchScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return AppButton(
      margin: EdgeInsets.all(15),
      color: JPColors.js_primaryColor,
      onTap: () async {
        JSJobSearchScreen().launch(context);
        // if (formKey.currentState!.validate()) {
        //   await context.read<SignUpProvider>().signUp(context);
        // }
        //
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Continue", style: boldTextStyle(color: white)),
          8.width,
          Icon(Icons.arrow_forward, color: white, size: iconSize),
        ],
      ),
    );
  }
}
