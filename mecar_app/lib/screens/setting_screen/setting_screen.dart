import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/themes_blocs/themes_bloc.dart';
import 'package:mecar_app/constants/key_translate.dart';
import 'package:mecar_app/widgets/header_content_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        final themeBloc = BlocProvider.of<ThemesBloc>(context);

        return Scaffold(
          body: Column(
            children: [
              HeaderContent(title: SETTING_KEY.tr(), onClickFunction: () => Navigator.pop(context)),
              TextButton(
                  onPressed: () => themeBloc.add(ToggleThemeEvent()),
                  child: Text(CHANGE_THEMES_KEY.tr())),
              TextButton(
                  onPressed: () => themeBloc.add(ToggleLanguageEvent(context)),
                  child: Text(CHANGE_LANGUAGE_KEY.tr()))
            ],
          ),
        );
      },
    );
  }
}
