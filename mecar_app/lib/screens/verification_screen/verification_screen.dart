import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/user_info_blocs/user_info_bloc.dart';

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
                  HeaderContent(title: 'Verification', onClickFunction: onClickFunction),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 19, bottom: 40),
                    child: Text(
                      'Please enter the 6 digit code that was sent to \n${state.phoneNumber}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 113),
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
                          inactiveColor: Color(0xFFACACAC),
                          activeColor: Color(0xFFACACAC),
                          selectedColor: Color(0xFFACACAC),
                          activeFillColor: Color(0xFFACACAC),
                          selectedFillColor: Color(0xFFACACAC),
                          inactiveFillColor: Color(0xFFACACAC),
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
                    title: 'Verify',
                    onClickFunction: () {},
                    type: ButtonType.verify,
                  ),
                  const SizedBox(height: 20),
                  CountdownOTP(timeCountdown: 3)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
