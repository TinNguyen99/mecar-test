import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_app/blocs/user_info_blocs/user_info_bloc.dart';
import 'package:mecar_app/constants/key_translate.dart';
import 'package:mecar_app/screens/verification_screen/verification_screen.dart';
import 'package:mecar_app/utils/validation_phone_vn.dart';
import 'package:mecar_app/widgets/header_content_widget.dart';
import 'package:mecar_app/widgets/mecar_button_widget.dart';
import 'package:mecar_app/widgets/row_text_action_widget.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  final textController = TextEditingController();
  final int maxLengthOfPhoneNumber = 10;
  bool isValidPhoneNumber = true;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            final userInfoBloc = BlocProvider.of<UserInfoBloc>(context);
            return Container(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          HeaderContent(
                              title: SIGN_UP_KEY.tr(),
                              onClickFunction: () {
                                Navigator.pop(context);
                              }),
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              RowTextAction(
                                  colorTextAction: TextActionColor.info,
                                  textAction: TERM_OF_USE_KEY.tr(),
                                  title: BY_REGISTER_KEY.tr(),
                                  onClickFunction: () {}),
                              RowTextAction(
                                  colorTextAction: TextActionColor.info,
                                  textAction: PRICACY_POLICY_KEY.tr(),
                                  title: ACKNOWLEDGE_THEIR_KEY.tr(),
                                  onClickFunction: () {}),
                              const SizedBox(height: 55),
                              Container(
                                width: maxWidth * 0.9,
                                height: 50,
                                child: TextFormField(
                                  controller: textController,
                                  keyboardType: TextInputType.number,
                                  maxLength: maxLengthOfPhoneNumber,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      counterText: "",
                                      hintText: PHONE_NUMBER_KEY.tr(),
                                      hintStyle: const TextStyle(
                                          color: Color(0xFFACACAC), fontWeight: FontWeight.w400),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: isValidPhoneNumber
                                                ? const Color(0xFFE1E1E1)
                                                : Colors.red.shade200),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: !isValidPhoneNumber
                                                ? Colors.red.shade200
                                                : theme.primaryColor),
                                        borderRadius: BorderRadius.circular(2),
                                      )),
                                ),
                              ),
                              const SizedBox(height: 20),
                              MecarButton(
                                  title: NEXT_KEY.tr(),
                                  onClickFunction: () {
                                    if (phoneNumberRegExp.hasMatch(textController.value.text)) {
                                      userInfoBloc
                                          .add(UpdatePhoneNumberEvent(textController.value.text));
                                      setState(() {
                                        isValidPhoneNumber = true;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const VerificationScreen()),
                                      );
                                    } else {
                                      setState(() {
                                        isValidPhoneNumber = false;
                                      });
                                    }
                                  }),
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: RowTextAction(
                        colorTextAction: TextActionColor.login,
                        textAction: LOGIN_KEY.tr(),
                        title: ALREADY_MEMBER_KEY.tr(),
                        onClickFunction: () {}),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
