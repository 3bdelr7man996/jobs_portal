import 'package:flutter/material.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/data/model/search_job_model.dart';
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/view/components/JSJobDetailComponent.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

Future<T?> showModalJobDetils<T>(BuildContext context,
    {required SearchData job}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.90,
        child: Stack(
          children: [
            JSJobDetailComponent(
              filteredResultsList: job,
            ),
            Consumer<HomeProvider>(builder: (context, provider, _) {
              return provider.applyLoader
                  ? Loader()
                  : Positioned(
                      left: 0,
                      right: 0,
                      bottom: 8,
                      child: AppButton(
                        onTap: () {
                          //todos
                          if (job.slug != null) {
                            context
                                .read<HomeProvider>()
                                .applyJob(context, job.slug!);
                          }
                          // JSHomeScreen().launch(context);
                        },
                        width: context.width(),
                        margin: EdgeInsets.all(16),
                        color: JPColors.js_primaryColor,
                        child: Text("Apply Now",
                            style: boldTextStyle(color: white)),
                      ),
                    );
            }),
          ],
        ),
      );
    },
  );
}
