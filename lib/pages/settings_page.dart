import 'package:code_juge/l10n/app_localizations.dart';
import 'package:code_juge/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final themeFocusNode = FocusNode();
    final settingsController = Provider.of<SettingsController>(context);
    final currentMode = settingsController.selectedTheme;
    final currentLocalization = settingsController.selectedLocale?.languageCode ?? 'system';
    // Get translation
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.settings), // Settings
        backgroundColor: theme.colorScheme.primaryContainer,
      ), //Title: Settings
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: ListTile(
              title: Text(appLocalizations.themeMode), // Theme Mode:
              trailing: SizedBox(
                width: 86,
                child: DropdownButtonHideUnderline(
                child: DropdownButton<ThemeMode>(
                  focusNode: themeFocusNode,
                  value: currentMode,
                  onChanged: (mode) {
                    settingsController.applyTheme(mode!);
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(appLocalizations.system)  // System
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(appLocalizations.lightMode) // Light
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(appLocalizations.darkMode) // Dark
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListTile(
              title: Text(appLocalizations.localisationMode), // Language:
              trailing: SizedBox(
                width: 86,
                child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusNode: themeFocusNode,
                  value: currentLocalization,
                  onChanged: (value) {
                      if (value == 'system') {
                        settingsController.applyLanguage(null);
                      } else {
                        settingsController.applyLanguage(Locale(value!));
                      }
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  items: [
                      DropdownMenuItem(
                        value: 'system',
                        child: Text(appLocalizations.system), // System
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(appLocalizations.localeEnglish), // English
                      ),
                      DropdownMenuItem(
                        value: 'de',
                        child: Text(appLocalizations.localeGerman), // German
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Divider(thickness: 1, height: 1),
          Container(
            padding: const EdgeInsets.all(12),
            color: theme.colorScheme.surfaceContainerHigh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(appLocalizations.aboutThisButton), // About this project
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1/CodeJudge");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
                TextButton(
                  child: Text(appLocalizations.seeLicenseButton), // See the license
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1/CodeJudge?tab=License-1-ov-file");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
                TextButton(
                  child: Text(appLocalizations.reportABugButton), // Report a bug
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1/CodeJudge/issues/new?template=bug-report-for-code-judge.md");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
                TextButton(
                  child: Text(appLocalizations.requestAFeatureButton), // Request a feature
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1/CodeJudge/issues/new?template=feature-request-for-code-judge.md");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
                TextButton(
                  child: Text(appLocalizations.seeReleasesButton), // See all releases
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1/CodeJudge/releases");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
                TextButton(
                  child: Text(appLocalizations.aboutMeButton), // About the developer
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/naibaf-1");
                
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  },
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}