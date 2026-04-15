import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

final shadowMd = BoxStyler()
    .shadow(
      .blurRadius(6)
          .spreadRadius(-1)
          .offset(x: 0, y: 4)
          .color(Colors.black.withValues(alpha: .1)),
    )
    .shadow(
      .blurRadius(4)
          .spreadRadius(-2)
          .offset(x: 0, y: 2)
          .color(Colors.black.withValues(alpha: .1)),
    );
