import 'package:blue_thermal_printer/blue_thermal_printer.dart';

mixin BluetoothPrinterBaseMixin {
  BlueThermalPrinter get bluetooth => BlueThermalPrinter.instance;
}
