import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

enum TextActionColor { login, info }

class RowTextAction extends StatelessWidget {
  const RowTextAction(
      {Key? key,
      required this.title,
      required this.onClickFunction,
      required this.textAction,
      required this.colorTextAction})
      : super(key: key);

  final String title;
  final VoidCallback onClickFunction;
  final String textAction;
  final TextActionColor colorTextAction;

  @override
  Widget build(BuildContext context) {
    // bool isLoginType = textAction == TextActionColor.login ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title '),
        InkWell(
          onTap: () {},
          child: Text(textAction,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorTextAction == TextActionColor.info
                      ? const Color(0xFF007AFC)
                      : null)),
        )
      ],
    );
  }
}
