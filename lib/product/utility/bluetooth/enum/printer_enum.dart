enum PrinterSize {
  medium, //normal size text
  bold, //only bold text
  boldMedium, //bold with medium
  boldLarge, //bold with large
  extraLarge //extra large
}

enum PrinterAlign {
  left, //ESC_ALIGN_LEFT
  center, //ESC_ALIGN_CENTER
  right, //ESC_ALIGN_RIGHT
}

extension ExntesionPrintSize on PrinterSize {
  int get val {
    switch (this) {
      case PrinterSize.medium:
        return 0;
      case PrinterSize.bold:
        return 1;
      case PrinterSize.boldMedium:
        return 2;
      case PrinterSize.boldLarge:
        return 3;
      case PrinterSize.extraLarge:
        return 4;
    }
  }
}

extension ExtensionPrintAlign on PrinterAlign {
  int get value {
    switch (this) {
      case PrinterAlign.left:
        return 0;
      case PrinterAlign.center:
        return 1;
      case PrinterAlign.right:
        return 2;
    }
  }
}
