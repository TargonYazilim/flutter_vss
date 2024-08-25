import 'package:flutter/material.dart';

enum ProjectImages {
  imgShipment('img_shipment'),
  imgOrder('img_order');

  final String value;
  const ProjectImages(this.value);

  Widget toWidget({double? height, double? width}) {
    return _imageAsset(height: height, width: width);
  }

  ImageProvider toImageProvider({double? height, double? width}) {
    return _imageAsset(height: height, width: width).image;
  }

  Image _imageAsset({double? height, double? width}) =>
      Image.asset(_path, height: height, width: width);

  String get _path => 'assets/images/$value.png';
}
