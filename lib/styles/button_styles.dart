import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/theme/tokens.dart';

final buttonBase = BoxStyler()
    .borderRadiusAll($radiusSm())
    .alignment(.center)
    .animate(.ease(150.ms));

BoxStyler primaryButton(BuildContext context) => buttonBase
    .color($primary())
    .onHovered(.color($primary.resolve(context).withValues(alpha: .9)));

BoxStyler secondaryButton(BuildContext context) => buttonBase
    .color($secondary())
    .onHovered(.color($secondary.resolve(context).withValues(alpha: .8)));

BoxStyler destructiveButton(BuildContext context) => buttonBase
    .color($destructive())
    .onHovered(.color($destructive.resolve(context).withValues(alpha: .9)));
