import 'package:flutter/material.dart';
import 'package:fooddelivery/shared/style/colors.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  String label;
  IconData? prefix;
  bool? isPrefix;
  IconData? suffix;
  double width;
  double radius;
  bool isPassword = false;
  Function? suffixPressed;
  TextStyle? hintStyle;
  DefaultFormField({
    required this.controller,
    required this.type,
    required this.label,
    this.prefix,
    this.isPrefix = false,
    this.suffix,
    this.width = double.infinity,
    this.radius = 10.0,
    this.suffixPressed,
    this.hintStyle,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(width: 1, color: greyStroke.withOpacity(0.05)),
        borderRadius: BorderRadiusDirectional.all(Radius.circular(radius)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: hintStyle,
            prefixIcon: isPrefix == false
                ? null
                : Icon(
                    prefix,
                    color: green,
                  ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: () {
                      suffixPressed!();
                    },
                    icon: Icon(
                      suffix,
                    ),
                  )
                : null,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
