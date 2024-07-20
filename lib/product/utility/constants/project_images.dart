import 'package:flutter/material.dart';

enum ProjectImages {
  imgShipment('img_shipment'),
  imgTransport('img_transport');

  final String value;
  const ProjectImages(this.value);

  Widget toWidget({double? height, double? width}) {
    return Image.asset(_path, height: height, width: width);
  }

  String get _path => 'assets/images/$value.png';
}
