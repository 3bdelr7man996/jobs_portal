import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ExpectedSalary extends StatelessWidget {
  const ExpectedSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      alignment: Alignment.center,
      decoration: boxDecoration(
          radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
      child: AppTextField(
        textFieldType: TextFieldType.NUMBER,
        keyboardType: TextInputType.number,
        initialValue: context.read<ProfileProvider>().expectedSalary,
        decoration: jsInputDecoration(hintText: "Expected Salary"),
        onChanged: (text) {
          context.read<ProfileProvider>().setExpectedSalary(text);
        },
      ),
    );
  }
}
