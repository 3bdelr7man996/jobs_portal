import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/components/MultiSelectedDialog.dart';
import 'package:provider/provider.dart';

class CareerLevelsFilter extends StatelessWidget {
  const CareerLevelsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return filteredWidget(
        widget: Row(
          children: [
            Text('Career Levels'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        onTap: () async {
          final selectedList = await showDialog<List<Configuration>>(
            context: context,
            builder: (BuildContext context) {
              return MultiSelectDialog(
                title: "Select Career Level",
                items: provider.myConfigurations?.careerLevels ?? [],
                initiallySelected: provider.selectedCarrerLevel,
              );
            },
          );

          if (selectedList != null) {
            provider.updateSelectedCarrerLevel(selectedList);
          }
        },
      );
    });
  }
}
