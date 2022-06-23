import 'package:flutter/material.dart';

class ConditionalBuilder extends StatelessWidget {
  bool condition;
  Widget builder;
  Widget fallback;

  ConditionalBuilder({
    required this.condition,
    required this.builder,
    required this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    if (this.condition) return builder;

    return fallback;
  }
}
