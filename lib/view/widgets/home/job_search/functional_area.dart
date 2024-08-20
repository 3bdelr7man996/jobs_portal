import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/components/MultiSelectedDialog.dart';
import 'package:provider/provider.dart';

class FunctionalAreaFilter extends StatelessWidget {
  const FunctionalAreaFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return filteredWidget(
        widget: Row(
          children: [
            Text('Functional Area'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        onTap: () async {
          final selectedList = await showDialog<List<Configuration>>(
            context: context,
            builder: (BuildContext context) {
              return MultiSelectDialog(
                title: "Select Functional Area",
                items: provider.myConfigurations?.functionalAreas ?? [],
                initiallySelected: provider.selectedFunctions,
              );
            },
          );

          if (selectedList != null) {
            provider.updateSelectedFunctions(selectedList);
          }
        },
      );
    });
  }
}
