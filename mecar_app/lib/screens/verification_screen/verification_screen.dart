import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/user_info_blocs/user_info_bloc.dart';
import 'package:mecar_app/constants/key_translate.dart';
import 'package:mecar_app/themes/app_themes.dart';

import 'package:mecar_app/widgets/countdown_otp.dart';
import 'package:mecar_app/widgets/header_content_widget.dart';
import 'package:mecar_app/widgets/mecar_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textEditingController = TextEditingController();
    final lightGreyColor = theme.colorScheme.lightGrey;
    const int timeOfCountdownOTP = 3;

    onClickFunction() {
      Navigator.pop(context);
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            return Container(
              width: maxWidth,
              child: Column(
                children: [
                  HeaderContent(title: VERIFICATION_KEY.tr(), onClickFunction: onClickFunction),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 19, bottom: 40),
                    child: Text(
                      '${ENTER_OTP_CODE_TITLE_KEY.tr()}${state.phoneNumber}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      width: maxWidth * 0.4,
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: Color(0xFFACACAC),
                        ),
                        length: 6,
                        animationType: AnimationType.fade,
                        onTap: () {
                          textEditingController.clear();
                        },
                        pinTheme: PinTheme(
                          inactiveColor: lightGreyColor,
                          activeColor: lightGreyColor,
                          selectedColor: lightGreyColor,
                          activeFillColor: lightGreyColor,
                          selectedFillColor: lightGreyColor,
                          inactiveFillColor: lightGreyColor,
                          shape: PinCodeFieldShape.underline,
                          fieldHeight: 30,
                          fieldWidth: 20,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      )),
                  const SizedBox(height: 50),
                  MecarButton(
                    title: VERIFY_KEY.tr(),
                    onClickFunction: () {},
                    type: ButtonType.verify,
                  ),
                  const SizedBox(height: 20),
                  CountdownOTP(timeCountdown: timeOfCountdownOTP)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
