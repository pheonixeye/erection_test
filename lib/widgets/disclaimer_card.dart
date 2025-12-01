import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DisclaimerCard extends StatelessWidget {
  DisclaimerCard({super.key, this.onTap});
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<PxTheme>(
      builder: (context, t, _) {
        return Column(
          children: [
            const Spacer(),
            Card.outlined(
              elevation: 2,
              color: t.isDark ? Colors.blue : Colors.blue.shade50,
              child: ListTile(
                title: Row(
                  children: [
                    Text(context.loc.disclaimerTitle),
                    const Spacer(),
                    IconButton.outlined(
                      onPressed: onTap,
                      icon: const Icon(Icons.close),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: context.loc.disclaimerP1,
                    children: [
                      TextSpan(text: '\n'),
                      TextSpan(text: context.loc.disclaimerP2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
