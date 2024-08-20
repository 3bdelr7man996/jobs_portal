import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/data/model/app_configurations_model.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/components/MultiSelectedDialog.dart';
import 'package:provider/provider.dart';

class CountryFilter extends StatelessWidget {
  const CountryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return filteredWidget(
        widget: Row(
          children: [
            Text('Countries'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        onTap: () async {
          final selectedCountries = await showDialog<List<Configuration>>(
            context: context,
            builder: (BuildContext context) {
              return MultiSelectDialog(
                items: provider.myConfigurations?.countries ?? [],
                initiallySelected: provider.selectedCountries,
              );
            },
          );

          if (selectedCountries != null) {
            provider.updateSelectedCountries(selectedCountries);
          }
        },
      );
    });
  }
}
