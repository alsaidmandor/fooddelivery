import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/style/colors.dart';

import '../constants.dart';

class DefaultTextButton extends StatelessWidget {
  Function function;
  String text;
  bool isUpper;

  DefaultTextButton({
    required this.function,
    required this.text,
    this.isUpper = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: isUpper == true
          ? Text(
              text.toUpperCase(),
              style:   textSize(context).caption?.copyWith(color: green),
            )
          : Text(
              text,
              style:textSize(context).caption?.copyWith(color: green),
            ),
    );
    ;
  }
}
