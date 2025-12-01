import 'dart:ui';
import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double radius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? color;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.blur = 20,
    this.radius = 20,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PxTheme>(
      builder: (context, t, _) {
        return Container(
          margin: margin,
          decoration: BoxDecoration(
            color:
                color ??
                (!t.isDark
                    ? Colors.white.withValues(alpha: 0.6)
                    : AppTheme.surfaceDark),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFFFFF),
                offset: Offset(-6, -6),
                blurRadius: 14,
              ),
              BoxShadow(
                color: Color(0xFFBFC4CF),
                offset: Offset(6, 6),
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
