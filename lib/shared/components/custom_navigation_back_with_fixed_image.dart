import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/style/colors.dart';

import 'custom_container.dart';

class CustomNavigationBackWithFixedImage extends StatelessWidget {
  final Function? function;

  const CustomNavigationBackWithFixedImage({Key? key, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: CustomContainer(
            width: 45.0,
            height: 45.0,
            color: grayOrange3.withOpacity(0.2),
            radius: 15.0,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: grayOrange1,
                  )),
            ),
          ),
        ),
        const Expanded(
          child: Image(
            image: AssetImage('assets/images/pattern2.png'),
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
