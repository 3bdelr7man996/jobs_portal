import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: textFieldHeight,
      alignment: Alignment.center,
      decoration: boxDecoration(
        radius: 8,
        color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
      ),
      child: IntlPhoneField(
        textAlign: TextAlign.left,
        initialValue: context.read<ProfileProvider>().mobile,
        decoration: jsInputDecoration(hintText: "Phone Number"),
        initialCountryCode: 'AE',
        onChanged: (phone) {
          debugPrint(phone.completeNumber);
          context.read<ProfileProvider>().setMobile(phone.completeNumber);
        },
        onCountryChanged: (country) {
          // Get the selected country code.
          String countryCode = country.code;
          debugPrint("country code $countryCode");
        },
      ),
    );
  }
}
