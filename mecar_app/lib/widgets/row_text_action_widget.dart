import 'package:flutter/material.dart';

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
  final String textAction;
  final VoidCallback onClickFunction;
  final TextActionColor colorTextAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$title '),
        InkWell(
          onTap: () {},
          child: Text(textAction,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorTextAction == TextActionColor.info ? const Color(0xFF007AFC) : null)),
        )
      ],
    );
  }
}
