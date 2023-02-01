import 'package:flutter/material.dart';
import 'package:food_dept_bd/config/config.dart';
import 'package:food_dept_bd/routes/custom_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/login/login_page.dart';
// import 'screens/sampless/verification.dart';

void main() {
  runApp(const Starter());
}

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _StarterState? state = context.findAncestorStateOfType<_StarterState>();
    state?.setLocale(newLocale);
  }
}

class _StarterState extends State<Starter> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: CustomRouter.generatedRoute,
      initialRoute: loginRoute,

      // home: Verification(),
    );
  }
}
