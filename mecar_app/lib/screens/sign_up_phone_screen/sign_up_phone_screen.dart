import 'package:flutter/material.dart';
import 'package:mecar_app/screens/verification_screen/verification_screen.dart';

class SignUpPhoneScreen extends StatelessWidget {
  const SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SignUpPhoneScreen'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerificationScreen()),
                  );
                },
                child: const Text('Navigate to VerificationScreen')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Login'))
          ],
        ));
  }
}
