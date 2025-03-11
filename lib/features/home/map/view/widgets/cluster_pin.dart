import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiliz/core/constants/app_colors.dart';

class ClusterPin extends StatelessWidget {
  const ClusterPin({
    super.key,
    required this.assetPath,
    required this.count,
  });
  final String assetPath;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: PinShadowPainter(),
          child: SvgPicture.asset(
            assetPath,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.white50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PinShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    final shadowRect = Rect.fromLTWH(0, size.height - 2, size.width, 4);
    canvas.drawRect(shadowRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
