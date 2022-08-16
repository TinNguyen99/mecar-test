import 'package:flutter/material.dart';

class HeaderContent extends StatefulWidget {
  const HeaderContent({Key? key, required this.title, required this.onClickFunction})
      : super(key: key);

  final String title;
  final VoidCallback onClickFunction;

  @override
  State<HeaderContent> createState() => _HeaderContentState();
}

class _HeaderContentState extends State<HeaderContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: widget.onClickFunction,
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
        Text(widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }
}
