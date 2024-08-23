import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ProjectIcons {
  iconBarcode('icon_barcode');

  final String value;
  const ProjectIcons(this.value);

  
}

extension ProjectIconsExtension on ProjectIcons {
 Widget toWidget({double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      _path,
      height: height,
      width: width,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  String get _path => 'assets/icons/$value.svg';
}
