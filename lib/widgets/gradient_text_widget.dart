import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final Text text;
  final Gradient gradient;

  const GradientText({
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return this.gradient.createShader(Offset.zero & bounds.size);
      },
      child: DefaultTextStyle.merge(
        // Sets the default text color to white.
        // The text color must be white for the gradient to work.
        style: this.text.style?.copyWith(color: Colors.white),
        child: this.text,
      ),
    );
  }
}
