import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mecar_app/blocs/themes_blocs/themes_bloc.dart";
import "package:mecar_app/blocs/user_info_blocs/user_info_bloc.dart";
import "package:mecar_app/screens/login_screen/login_screen.dart";
import "package:easy_localization/easy_localization.dart";
import "package:mecar_app/themes/app_themes.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Locale currentLocale = Locale("en");
  final prefs = await SharedPreferences.getInstance();
  final String? currentLanguageStorage = prefs.getString("language");
  final String? currentThemeStorage = prefs.getString("themes");

  if (currentLanguageStorage != null) {
    currentLocale = Locale(currentLanguageStorage);
  } else {
    final defaultLanguage = Platform.localeName.substring(0, 2);
    currentLocale = Locale(defaultLanguage);
  }

  runApp(EasyLocalization(
      supportedLocales: [Locale("en"), Locale("vi")],
      path: "lib/assets/translations",
      fallbackLocale: currentLocale,
      child: MyApp(themeStorage: currentThemeStorage)));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.themeStorage}) : super(key: key);
  final String? themeStorage;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemesBloc>(
          create: (BuildContext context) => ThemesBloc(),
        ),
        BlocProvider<UserInfoBloc>(
          create: (BuildContext context) => UserInfoBloc(),
        ),
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          final themesBloc = BlocProvider.of<ThemesBloc>(context);
          themesBloc.add(InitialThemeEvent());

          return MaterialApp(
            title: "Flutter Demo",
            themeMode: state.themeMode,
            theme: AppThemes.darkTheme,
            darkTheme: AppThemes.lightTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
