import 'package:flutter/material.dart';
import 'package:mecar_app/constants/image_assets.dart';

enum ButtonType { login, verify }

class MecarButton extends StatelessWidget {
  const MecarButton(
      {Key? key,
      this.type = ButtonType.verify,
      required this.title,
      required this.onClickFunction})
      : super(key: key);

  final ButtonType? type;
  final String title;
  final VoidCallback onClickFunction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final widthOfButton = MediaQuery.of(context).size.width * 0.9;
    final colorWhite = type == ButtonType.verify ? Colors.white : null;

    return InkWell(
      onTap: onClickFunction,
      child: Container(
        height: 50,
        width: widthOfButton,
        decoration: BoxDecoration(
            color: type == ButtonType.verify ? theme.primaryColor : null,
            border: Border.all(
              color: theme.primaryColor,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(2))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          type == ButtonType.login
              ? SizedBox(
                  height: 17,
                  child: Image.asset(
                    MAIL_IMG,
                    color: colorWhite,
                  ))
              : Container(),
          Text(
            title,
            style: TextStyle(
                decoration:
                    type == ButtonType.login ? TextDecoration.underline : null,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorWhite),
          ),
          const SizedBox(
            height: 17,
            width: 17,
          ),
        ]),
      ),
    );
  }
}
