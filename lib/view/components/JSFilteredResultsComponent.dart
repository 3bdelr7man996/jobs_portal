import 'package:flutter/material.dart';
import 'package:job_search/data/model/JSPopularCompanyModel.dart';
import 'package:job_search/core/utils/JSDataGenerator.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/widgets/JSFilteredResultWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class JSFilteredResultsComponent extends StatefulWidget {
  final String? city;

  JSFilteredResultsComponent({this.city});

  @override
  _JSFilteredResultsComponentState createState() =>
      _JSFilteredResultsComponentState();
}

class _JSFilteredResultsComponentState
    extends State<JSFilteredResultsComponent> {
  List<JSPopularCompanyModel> filteredResultsList = getFilteredResultsData();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return provider.searchLoading
          ? Loader()
          : (!provider.searchLoading && provider.jobList.isEmpty)
              ? Center(
                  child: Text("No Results"),
                )
              : ListView.builder(
                  itemCount: provider.jobList.length,
                  padding: EdgeInsets.all(8),
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return JSFilteredResultWidget(
                      filteredResultsList: provider.jobList[index],
                      city: widget.city,
                      index: index,
                    );
                  },
                );
    });
  }
}
