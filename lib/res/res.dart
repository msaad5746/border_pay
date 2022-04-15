import 'package:borderpay/res/sizes.dart';
import 'package:borderpay/res/text_styles.dart';
import 'package:flutter/cupertino.dart';

import 'assets.dart';
import 'colors.dart';
import 'labels.dart';

late AppAssets assets;
late AppColors colors;
late AppLabels labels;
late AppSizes sizes;
late TextStyles textStyles;

bool _isInitialized = false;

void initializeResources({required BuildContext context}) {
  if (_isInitialized) {
    /**
     * this is to prevent
     * multiple initialization calls.
     */
    return;
  }

  sizes = AppSizes()..initializeSize(context);
  assets = AppAssets();
  colors = AppColors();
  labels = AppLabels();
  textStyles = TextStyles();
}
