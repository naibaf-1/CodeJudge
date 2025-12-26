import 'package:code_juge/l10n/app_localizations.dart';
import 'package:code_juge/main.dart';
import 'package:flutter/material.dart';

class MyAlertDialog {
  void showTrainingSuccessfullDialog(BuildContext context){
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(appLocalizations.alertSuccess), // Congratulations!
          // TODO Display result with translation!
          content: Text("Your Score..."),
          actions: [
            TextButton(
              child: Text(appLocalizations.alertClose), // Close
              onPressed: () {
                Navigator.pop(context);
                // Return home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageLayoutHandler()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}