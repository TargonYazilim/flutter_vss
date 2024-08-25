import 'dart:io';

import 'package:flutter/material.dart';

/// Manager your network error with screen

//TODO: check this class
final class ProductNetworkErrorManager {
  ProductNetworkErrorManager(this.context);

  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {}
  }
}
