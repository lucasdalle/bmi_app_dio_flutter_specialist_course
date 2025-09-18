import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const AppSpacing({required this.xs, required this.sm, required this.md, required this.lg, required this.xl});

  @override
  AppSpacing copyWith({double? xs, double? sm, double? md, double? lg, double? xl}) =>
      AppSpacing(xs: xs ?? this.xs, sm: sm ?? this.sm, md: md ?? this.md, lg: lg ?? this.lg, xl: xl ?? this.xl);

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
    );
  }

  static AppSpacing scaled(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width <= ScreenDesignParameters.mobileMaxWidth) {
      final scale = (width / ScreenDesignParameters.mobileBaseWidth).clamp(0.9, 1.1);
      return AppSpacing(xs: 4 * scale, sm: 8 * scale, md: 16 * scale, lg: 24 * scale, xl: 32 * scale);
    } else if (width <= ScreenDesignParameters.tabletMaxWidth) {
      final scale = (width / ScreenDesignParameters.tabletBaseWidth).clamp(0.95, 1.2);
      return AppSpacing(xs: 8 * scale, sm: 16 * scale, md: 24 * scale, lg: 32 * scale, xl: 48 * scale);
    } else {
      final scale = (width / ScreenDesignParameters.desktopBaseWidth).clamp(1.0, 1.3);
      return AppSpacing(xs: 12 * scale, sm: 20 * scale, md: 32 * scale, lg: 48 * scale, xl: 64 * scale);
    }
  }
}

extension AppSpacingExtension on BuildContext {
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
}
