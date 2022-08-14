import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/themes_blocs/themes_bloc.dart';
import 'package:mecar_app/screens/sign_up_phone_screen/sign_up_phone_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mecar_app/themes/app_themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        final themeBloc = BlocProvider.of<ThemesBloc>(context);
        var theme = Theme.of(context).colorScheme;
        return Container(
            color: theme.success,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LoginScreen',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const Text('Hello').tr(),
                Text(state.themeMode.toString()),
                TextButton(
                    onPressed: () {
                      print('ok');
                      themeBloc.add(ToggleThemeEvent());
                    },
                    child: const Text('Toggle Dark mode')),
                TextButton(
                    onPressed: () {
                      if (context.locale.toString() == 'vi') {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('vi'));
                      }
                    },
                    child: const Text('Change language')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPhoneScreen()),
                      );
                    },
                    child: const Text('Navigate to SignUpPhoneScreen'))
              ],
            ));
      },
    );
  }
}
