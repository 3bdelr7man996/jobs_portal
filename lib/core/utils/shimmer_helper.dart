import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'JSColors.dart';

Widget shimmerHelper({required Widget child}) {
  return Shimmer.fromColors(
    baseColor: JPColors.shimmerBaseColor,
    highlightColor: JPColors.shimmerHeighlightColor,
    child: child,
  );
}
