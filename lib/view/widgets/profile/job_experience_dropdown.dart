import 'package:flutter/material.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class JobExperienceDropdown extends StatelessWidget {
  JobExperienceDropdown({super.key});
  AppConfigurationModel? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = context.read<HomeProvider>().myConfigurations;
    return Consumer<ProfileProvider>(builder: (context, profile, _) {
      return Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 206, 206, 206)),
          backgroundColor:
              appStore.isDarkModeOn ? scaffoldDarkColor : Colors.white,
        ),
        //height: textFieldHeight,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: DropdownButton<Configuration>(
          hint: Text("Select Experience"),
          isExpanded: true,
          underline: Container(color: Colors.transparent),
          icon: Icon(Icons.arrow_drop_down),
          value: profile.userExperienceId != null
              ? homeProvider?.jobExperiences
                  ?.firstWhere((e) => e.id == profile.userExperienceId)
              : null,
          onChanged: (Configuration? v) {
            if (v != null) {
              context.read<ProfileProvider>().setExperienceId(v.id!);
            }
          },
          items: context
              .read<HomeProvider>()
              .myConfigurations
              ?.jobExperiences
              ?.map<DropdownMenuItem<Configuration>>((Configuration config) {
            return DropdownMenuItem<Configuration>(
              value: config,
              child: Text(config.name ?? ''),
            );
          }).toList(),
        ),
      );
    });
  }
}
