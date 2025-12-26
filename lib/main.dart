import 'package:code_juge/layouts/DesktopLayout.dart';
import 'package:code_juge/layouts/MobileLayout.dart';
import 'package:code_juge/layouts/TabletLayout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeJudge',
      theme: ThemeData(
        // Apply the theme
        colorScheme: .fromSeed(seedColor: Colors.lime),
      ),
      home: HomePageLayoutHandler(),
    );
  }
}

// Decide for the correct layout depending on the screen type
class HomePageLayoutHandler extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final screenType = Responsive.getScreenType(constrains.maxWidth);
      
        // Use the correct layout depending on the screensize
        switch (screenType) {
          // User is supposed to use a desktop
          case ScreenType.desktop:
          return Desktoplayout();
          // Tablet would be fine too
          case ScreenType.tablet:
            return Tabletlayout();
          // Mobile devices are probably useless
          case ScreenType.mobile:
            return Mobilelayout();
        }
      },
    );
  }
}

// Define the screen types
enum ScreenType {mobile, tablet, desktop}
// Apply the correct screen type
class Responsive{
    static ScreenType getScreenType (double width) {
    // For desktops
    if (width >= 1200) {
      return ScreenType.desktop;
    }
    // For tablets
    if (width >= 900) {
      return ScreenType.tablet;
    }
    // Else it's a mobile phone
    return ScreenType.mobile;
  }
}