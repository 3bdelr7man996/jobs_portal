import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class PasswordProfile extends StatelessWidget {
  const PasswordProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      alignment: Alignment.center,
      decoration: boxDecoration(
          radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
      child: AppTextField(
        textFieldType: TextFieldType.PASSWORD,
        keyboardType: TextInputType.visiblePassword,
        decoration: jsInputDecoration(hintText: "Password"),
        onChanged: (text) {
          context.read<ProfileProvider>().setPassword(text);
        },
      ),
    );
  }
}
