import 'package:flutter/material.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/main.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/provider/profile_provider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FunctionalAreaDropdown extends StatelessWidget {
  FunctionalAreaDropdown({super.key});
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
          hint: Text("Select Functional Area"),
          isExpanded: true,
          underline: Container(color: Colors.transparent),
          icon: Icon(Icons.arrow_drop_down),
          value: profile.userFunctionId != null
              ? homeProvider?.functionalAreas
                  ?.firstWhere((e) => e.id == profile.userFunctionId)
              : null,
          onChanged: (Configuration? v) {
            if (v != null) {
              context.read<ProfileProvider>().setFunctionId(v.id!);
            }
          },
          items: homeProvider?.functionalAreas
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
