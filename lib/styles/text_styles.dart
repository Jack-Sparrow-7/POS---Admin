import 'package:mix/mix.dart';

import '../theme/tokens.dart';

final headingLg = TextStyler()
    .fontFamily('DMSans')
    .fontSize(24)
    .fontWeight(.bold)
    .color($foreground());

final headingMd = TextStyler()
    .fontFamily('DMSans')
    .fontSize(18)
    .fontWeight(.w600)
    .color($foreground());

final bodyText = TextStyler()
    .fontFamily('DMSans')
    .fontSize(14)
    .color($foreground());

final mutedText = TextStyler()
    .fontFamily('DMSans')
    .fontSize(14)
    .color($mutedFg());

final bradingText = TextStyler()
    .fontFamily('Arizonia')
    .fontSize(40)
    .color($primary());
