import 'package:flutter/material.dart';

void navigateTo({
  required context,
  required widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void onBackPress({
  required context,
}) =>
    Navigator.pop(context);

void navigateAndFinish({
  required context,
  required widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
