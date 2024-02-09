 // ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/MyTheme.dart';
import 'package:islami/screens/getstart/get_start_home.dart';
import 'package:islami/screens/hades/display_content_hades.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/quran/view/widget/quran_tap_display_sura&audio.dart';
import 'package:islami/generated/l10n.dart';
import 'package:islami/providers/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChangeLunguageApp(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLunguageApp>(context);
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return MaterialApp(
            locale: Locale(provider.appLunguage),
            theme: MyTheme.themeLight,
            darkTheme: MyTheme.themeDark,
            themeMode: provider.themeMode,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: HomeGetstart.routeName,
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              DisplayQuran.routeName: (context) => DisplayQuran(),
              DisplayHades.routeName: (context) => DisplayHades(),
              HomeGetstart.routeName: (context) => HomeGetstart(),
            },
          );
        });
  }
}
