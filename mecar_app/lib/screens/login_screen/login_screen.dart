import 'package:flutter/material.dart';
import 'package:mecar_app/screens/sign_up_phone_screen/sign_up_phone_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LoginScreen'),
            const Text('Hello').tr(),
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
  }
}
