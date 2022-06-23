import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  double width;
  double height;
  Function function;
  String text;
  bool isUpper;
  double radius;
  DefaultButton({
    required this.function,
    this.width = 100,
    this.height = 40,
    required this.text,
    this.isUpper = true,
    this.radius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        color: green,
        onPressed: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isUpper ? text.toUpperCase() : text,
              style: GoogleFonts.ptSans(
                  textStyle:
                      textSize(context).bodyText2!.copyWith(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
