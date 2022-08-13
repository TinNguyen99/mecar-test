import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('VerificationScreen'),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to SignUpPhone'))
          ],
        ));
  }
}
