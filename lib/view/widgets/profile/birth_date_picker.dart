import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BirthdayPicker extends StatefulWidget {
  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  TextEditingController _birthdayController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: Locale("en"),
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        String month = picked.month.toString().padLeft(2, '0');
        String day = picked.day.toString().padLeft(2, '0');
        String year = picked.year.toString();

        _birthdayController.text = '$month/$day/$year';

        context.read<ProfileProvider>().setBirthDate(picked.toString());
        // context
        //     .read<AuthCubitForPatient>()
        //     .onbirthdayChange(_birthdayController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      alignment: Alignment.center,
      decoration: boxDecoration(
          radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
      child: AppTextField(
        controller: _birthdayController,
        //initialValue: context.read<ProfileProvider>().birthDate,
        textFieldType: TextFieldType.OTHER,
        keyboardType: TextInputType.datetime,
        onTap: () => _selectDate(context),
        readOnly: true,
        decoration: jsInputDecoration(
            hintText:
                "${context.read<ProfileProvider>().birthDate.isEmpty ? 'Birth Date' : context.read<ProfileProvider>().birthDate}"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        isValidationRequired: true,
      ),
    );
  }
}
