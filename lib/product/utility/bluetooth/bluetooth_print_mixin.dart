part of 'bluetooth_printer_operation.dart';

mixin BluetoothPrintMixin on BluetoothPrinterBaseMixin {
  Future<void> printNewLine() async {
    await bluetooth.printNewLine();
  }

  Future<void> printCustom({
    required String message,
    required PrinterSize size,
    required PrinterAlign align,
  }) async {
    await bluetooth.printCustom(message, size.val, align.value);
  }

  Future<void> printLeftRight({
    required String leftMessage,
    required String rightMessage,
    required PrinterSize size,
  }) async {
    await bluetooth.printLeftRight(leftMessage, rightMessage, size.val);
  }

  Future<void> printQRcode({
    required String textToQR,
    required int width,
    required int height,
    required PrinterAlign align,
  }) async {
    await bluetooth.printQRcode(textToQR, width, height, align.value);
  }

  Future<void> print3Column({
    required String leftMessage,
    required String centerMessage,
    required String rightMessage,
    required PrinterSize size,
  }) async {
    await bluetooth.print3Column(
      leftMessage,
      centerMessage,
      rightMessage,
      size.val,
    );
  }
}
