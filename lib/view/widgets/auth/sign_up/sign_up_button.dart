import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.formKey, required this.onTap});
  final GlobalKey<FormState> formKey;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return AppButton(
      margin: EdgeInsets.all(15),
      color: JPColors.js_primaryColor,
      onTap: onTap,
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
