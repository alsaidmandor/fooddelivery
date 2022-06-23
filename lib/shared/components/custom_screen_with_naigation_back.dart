import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'custom_navigation_back_with_fixed_image.dart';
import 'default_button.dart';

class CustomScreenWithNavigationBack extends StatelessWidget {
  final Widget widget;

  final Function clickOnButtonNext;
  final String title;
  const CustomScreenWithNavigationBack(
      {Key? key,
      required this.widget,
      required this.clickOnButtonNext,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        CustomNavigationBackWithFixedImage(
          function: (){
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 264.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.ptSans(
                          textStyle: textSize(context).headline5,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'This data will be displayed in your account profile for security',
                      style: GoogleFonts.ptSans(
                        textStyle: textSize(context).caption,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        widget,
        const SizedBox(height: 60.0),
        DefaultButton(
          text: 'Next',
          width: 175.0,
          height: 45,
          function: clickOnButtonNext,
          isUpper: false,
        ),
      ],
    );
  }
}
