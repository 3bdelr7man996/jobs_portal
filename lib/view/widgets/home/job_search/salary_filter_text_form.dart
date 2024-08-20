import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SalaryFromTextForm extends StatelessWidget {
  const SalaryFromTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: textFieldHeight,
        alignment: Alignment.center,
        decoration: boxDecoration(
            radius: 8,
            color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
        child: AppTextField(
          textFieldType: TextFieldType.NUMBER,
          keyboardType: TextInputType.number,
          decoration: jsInputDecoration(hintText: "From"),
          onChanged: (text) {
            context.read<HomeProvider>().updateSalaryFrom(text);
          },
        ),
      ),
    );
  }
}

class SalaryToTextForm extends StatelessWidget {
  const SalaryToTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: textFieldHeight,
        alignment: Alignment.center,
        decoration: boxDecoration(
            radius: 8,
            color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
        child: AppTextField(
          textFieldType: TextFieldType.NUMBER,
          keyboardType: TextInputType.number,
          decoration: jsInputDecoration(hintText: "To"),
          onChanged: (text) {
            context.read<HomeProvider>().updateSalaryTo(text);
          },
        ),
      ),
    );
  }
}
