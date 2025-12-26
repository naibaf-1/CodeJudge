library;

import 'package:code_juge/l10n/app_localizations.dart';
import 'package:code_juge/ui_elements/my_navigation_bar.dart';
import 'package:flutter/material.dart';

int selectedIndexInNavigationBar = 0;

List<MyNavigationBarItemData> getNavigationBarItems(BuildContext context) {
  final appLocalizations = AppLocalizations.of(context)!;

  return [
    MyNavigationBarItemData(icon: Icons.code, label: appLocalizations.exercises), // Exercises
    MyNavigationBarItemData(icon: Icons.settings, label: appLocalizations.settings), // Settings
  ];
}
