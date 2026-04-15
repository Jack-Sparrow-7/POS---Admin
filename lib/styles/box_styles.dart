import 'package:mix/mix.dart';
import 'package:pos_admin/theme/tokens.dart';

final card = BoxStyler()
    .paddingAll(16)
    .color($card())
    .borderAll(color: $border())
    .borderRadiusAll($radiusMd());
