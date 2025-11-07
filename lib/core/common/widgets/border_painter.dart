import 'package:eight_club_test/utils/app.colors.dart';
import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;

  const GradientBorderPainter({
    required this.strokeWidth,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final adjustedRect = rect.deflate(strokeWidth / 2); // ✅ Fix here

    // final gradient = const LinearGradient(
    //   begin: Alignment.bottomLeft,
    //   end: Alignment.topRight,
    //   colors: [Color(0xFF6A5AE0), Color(0xFF9B51E0)],
    // );

    final paint = Paint()
      ..shader = AppColors.borderGradient
          .createShader(adjustedRect) // ✅ Use adjusted rect
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final rRect = RRect.fromRectAndRadius(
      adjustedRect,
      Radius.circular(radius),
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
