import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/themes_blocs/themes_bloc.dart';
import 'package:mecar_app/screens/login_screen/login_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mecar_app/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path:
          'lib/assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemesBloc, ThemesState>(
//       builder: (context, state) {
//         ThemeMode dartModeString = state.themeMode;
//         return MaterialApp(
//             title: 'Flutter Demo',
//             // themeMode: dartModeString,
//             theme: AppThemes.lightTheme,
//             darkTheme: AppThemes.darkTheme,
//             localizationsDelegates: context.localizationDelegates,
//             supportedLocales: context.supportedLocales,
//             locale: context.locale,
//             home: MultiBlocProvider(
//               providers: [
//                 BlocProvider<ThemesBloc>(
//                   create: (BuildContext context) => ThemesBloc(),
//                 ),
//               ],
//               child: const LoginScreen(),
//             ));
//       },
//     );
//   }
// }
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemesBloc>(
          create: (BuildContext context) => ThemesBloc(),
        ),
      ],
      child: BlocBuilder<ThemesBloc, ThemesState>(
        builder: (context, state) {
          ThemeMode dartModeString = state.themeMode;
          print(dartModeString);
          print(ThemeMode.system);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: dartModeString,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
