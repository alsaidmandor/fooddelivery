import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/style/colors.dart';

class SoicalButton extends StatelessWidget {
  double width;
  Function function;
  String text;
  bool isUpper;
  double radius;
  String? image;
  SoicalButton(
      {required this.function,
      this.width = double.infinity,
      required this.text,
      this.isUpper = true,
      this.radius = 10.0,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 50.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: white.withOpacity(0.1),
          border: Border.all(width: 1, color: greyStroke),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(radius)),
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  'assets/images/$image',
                ),
                fit: BoxFit.cover,
                width: 25.0,
                height: 25.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                isUpper ? text.toUpperCase() : text,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
