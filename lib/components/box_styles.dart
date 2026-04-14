import 'package:mix/mix.dart';
import 'package:pos_admin/theme/tokens.dart';

final card = BoxStyler()
    .paddingAll(16)
    .color($card())
    .width(.infinity)
    .borderAll(color: $border())
    .borderRadiusAll(.circular(10));