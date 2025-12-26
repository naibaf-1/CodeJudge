import 'package:code_juge/main.dart';
import 'package:code_juge/ui_elements/navigation_bar.dart';
import 'package:code_juge/utils/global_variables.dart';
import 'package:flutter/material.dart';

class Tabletlayout extends StatefulWidget{
  @override
  State<Tabletlayout> createState() => _TabletlayoutState();
}

class _TabletlayoutState extends State<Tabletlayout> {
  Widget getSelectedPage() {
    switch (selectedIndexInNavigationBar) {
      case 0:
        // TODO Implement pages
      default:
        return Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyNavigationBar(
      screenType: ScreenType.mobile,
      selectedIndex: selectedIndexInNavigationBar,
      onItemSelected:(index) {
        // Normal navigation
        if (index != 3) {
          setState(() {
            selectedIndexInNavigationBar = index;
          });
        // TODO Open settings
        } else {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SettingsPage()),
          // );
        }
      },
      body: getSelectedPage(),
      items: getNavigationBarItems(context),
    );
  }
}