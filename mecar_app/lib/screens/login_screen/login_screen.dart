import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/themes_blocs/themes_bloc.dart';
import 'package:mecar_app/constants/image_assets.dart';
import 'package:mecar_app/screens/sign_up_phone_screen/sign_up_phone_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mecar_app/themes/app_themes.dart';
import 'package:mecar_app/widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        final themeBloc = BlocProvider.of<ThemesBloc>(context);
        var theme = Theme.of(context);
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
                    // padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Welcome',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: 5),
                        Text(
                            'You’re only a few step away from \n joining MeCar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
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
                  title: 'Login with Email/Phone',
                  onClickFunction: onClickToNatigate),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have account? ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    InkWell(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPhoneScreen()),
                        );
                      },
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
