import 'package:flutter/material.dart';
import 'package:mecar_app/screens/verification_screen/verification_screen.dart';
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
        body: Container(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      HeaderContent(
                          title: 'Sign up',
                          onClickFunction: () {
                            Navigator.pop(context);
                          }),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          RowTextAction(
                              colorTextAction: TextActionColor.info,
                              textAction: 'terms of use',
                              title: 'By register, I agree to Autoo’s',
                              onClickFunction: () {}),
                          RowTextAction(
                              colorTextAction: TextActionColor.info,
                              textAction: 'privacy policy',
                              title: '& acknowledge their',
                              onClickFunction: () {}),
                          const SizedBox(height: 55),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            child: TextFormField(
                              controller: textController,
                              keyboardType: TextInputType.number,
                              maxLength: 12,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  counterText: '',
                                  hintText: 'Phone number',
                                  hintStyle: const TextStyle(color: Color(0xFFACACAC), fontWeight: FontWeight.w400),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(width: 1, color: isValidPhoneNumber ? const Color(0xFFE1E1E1) : Colors.red.shade200),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: !isValidPhoneNumber ? Colors.red.shade200 : theme.primaryColor),
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 20),
                          MecarButton(
                              title: 'Next',
                              onClickFunction: () {
                                if (RegExp(r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(textController.value.text)) {
                                  setState(() {
                                    isValidPhoneNumber = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const VerificationScreen()),
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
                    colorTextAction: TextActionColor.login, textAction: 'Login', title: 'Already a member?', onClickFunction: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
