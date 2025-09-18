import 'package:bmi_app/config/constants.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(50),
          borderRadius: const BorderRadius.all(Radius.circular(kCardBorderRadius)),
        ),
        child: child,
      ),
    );
  }
}
