import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/themes_blocs/themes_bloc.dart';
import 'package:mecar_app/constants/image_assets.dart';
import 'package:mecar_app/constants/key_translate.dart';
import 'package:mecar_app/screens/setting_screen/setting_screen.dart';
import 'package:mecar_app/screens/sign_up_phone_screen/sign_up_phone_screen.dart';
import 'package:mecar_app/widgets/mecar_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        final themeBloc = BlocProvider.of<ThemesBloc>(context);
        final theme = Theme.of(context);
        void onClickToNatigate() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPhoneScreen()),
          );
        }

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 400,
                      width: maxWidth,
                      child: Image.asset(BACKGROUND_CAR_IMG, fit: BoxFit.fill)),
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Color(0x400F1317),
                    ),
                  ),
                  Positioned(
                    bottom: 62,
                    left: 42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(WELCOME_KEY.tr(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        Text(SUBCRIPTION_LOGIN_KEY.tr(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 4; ++i)
                            Container(
                              height: 1,
                              width: 19,
                              margin: const EdgeInsets.only(right: 6),
                              color: const Color(0xFF979797),
                            )
                        ],
                      ))
                ],
              ),
              MecarButton(
                  type: ButtonType.login,
                  title: LOGIN_WITH_PHONE_KEY.tr(),
                  onClickFunction: onClickToNatigate),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingScreen()),
                        );
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 20.0,
                      ),
                    ),
                    Text(
                      NOT_HAVE_ACCOUNT_KEY.tr(),
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    InkWell(
                      onTap: onClickToNatigate,
                      child: Text(
                        SIGN_UP_KEY.tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
