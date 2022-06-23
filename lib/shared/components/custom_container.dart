import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Widget widget;
  final Color color;

  const CustomContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.radius,
      required this.widget,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: widget,
    );
  }
}
