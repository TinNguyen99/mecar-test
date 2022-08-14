import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent(
      {Key? key, required this.title, required this.onClickFunction})
      : super(key: key);

  final String title;
  final VoidCallback onClickFunction;
// () {
//                             Navigator.pop(context);
//                           }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: onClickFunction,
              child: const Padding(
                padding: EdgeInsets.only(left: 24, top: 29),
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }
}
