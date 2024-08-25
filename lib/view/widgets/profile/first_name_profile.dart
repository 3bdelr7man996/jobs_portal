import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class FirstNameProfile extends StatelessWidget {
  const FirstNameProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      alignment: Alignment.center,
      decoration: boxDecoration(
          radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
      child: AppTextField(
        textFieldType: TextFieldType.NAME,
        keyboardType: TextInputType.name,
        initialValue: context.read<ProfileProvider>().firstName,
        decoration: jsInputDecoration(hintText: "First Name"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        isValidationRequired: true,
        onChanged: (text) {
          context.read<ProfileProvider>().setFirstName(text);
        },
      ),
    );
  }
}
