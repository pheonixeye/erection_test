import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double radius;

  const NeumorphicButton({
    super.key,
    required this.child,
    required this.onTap,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFFFFF),
                offset: Offset(-6, -6),
                blurRadius: 12,
              ),
              BoxShadow(
                color: Color(0xFFB9C0CE),
                offset: Offset(6, 6),
                blurRadius: 12,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
