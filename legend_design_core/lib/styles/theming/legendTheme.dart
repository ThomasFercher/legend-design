import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:legend_design_core/styles/theming/colors/legendColors.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizing.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/styles/theming/widget/appBarTheme.dart';
import 'package:legend_design_core/utils/restart.dart';

import 'colors/legendColorTheme.dart';
import 'sizing/legendSizingTheme.dart';

enum BottomBarType {
  NORMAl,
  HALFROUNDED,
  ROUNDED,
}
