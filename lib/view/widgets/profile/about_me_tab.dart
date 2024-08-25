import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSConstant.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'birth_date_picker.dart';
import 'career_level_dropdown.dart';
import 'countries_dropdown.dart';
import 'current_salary.dart';
import 'email_profile.dart';
import 'expected_salary.dart';
import 'first_name_profile.dart';
import 'functional_area_dropdown.dart';
import 'industries_dropdown.dart';
import 'job_experience_dropdown.dart';
import 'last_name.dart';
import 'midle_name_profile.dart';
import 'mobile.dart';
import 'password_profile.dart';

class AboutMeTab extends StatelessWidget {
  const AboutMeTab({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: FirstNameProfile()),
                  10.width,
                  Expanded(child: MiddleNameProfile()),
                ],
              ),
              16.height,
              LastNameProfile(),
              16.height,
              EmailProfile(),
              16.height,
              MobileTextField(),
              16.height,
              BirthdayPicker(),
              16.height,
              PasswordProfile(),
              16.height,
              IndustriesDropdown(),
              16.height,
              CountriesDropdown(),
              16.height,
              CareerLevelDropdown(),
              16.height,
              FunctionalAreaDropdown(),
              16.height,
              JobExperienceDropdown(),
              16.height,
              CurrentSalary(),
              16.height,
              ExpectedSalary(),
              30.height,
              Consumer<ProfileProvider>(builder: (context, provider, _) {
                return provider.updateLoad
                    ? Loader()
                    : AppButton(
                        margin: EdgeInsets.all(15),
                        color: JPColors.js_primaryColor,
                        onTap: () async {
                          await provider.updateProfile();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Save Edit",
                                style: boldTextStyle(color: white)),
                            8.width,
                            Icon(Icons.arrow_forward,
                                color: white, size: iconSize),
                          ],
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
