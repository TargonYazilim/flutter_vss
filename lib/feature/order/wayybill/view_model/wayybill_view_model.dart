import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vss/feature/order/wayybill/view_model/state/wayybill_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/interface/wayybill_operation.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/bluetooth/enum/printer_enum.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view/bluetooth_bottom_sheet.dart';

class WayybillViewModel extends BaseCubit<WayybillState> {
  WayybillViewModel({
    required WayyBillOperation wayyBillOperation,
    required Order order,
    required OrderOperation orderOperation,
    required HiveCacheOperation<Order> orderCacheOperation,
    required HiveCacheOperation<LoginResponse> loginResponseCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
    required IBluetoothPrinterOperation bluetoothOperation,
  })  : _wayyBillOperation = wayyBillOperation,
        _orderCacheOperation = orderCacheOperation,
        _loginResponseCacheOperation = loginResponseCacheOperation,
        _orderOperation = orderOperation,
        _sharedCacheOperation = sharedCacheOperation,
        _bluetoothOperation = bluetoothOperation,
        _order = order,
        super(const WayybillState(isLoading: false));

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Hive cache operation for login response
  final HiveCacheOperation<LoginResponse> _loginResponseCacheOperation;

  /// Shared pref operation
  final SharedCacheOperation _sharedCacheOperation;

  /// Bluetooth operations
  final IBluetoothPrinterOperation _bluetoothOperation;

  final OrderOperation _orderOperation;
  final WayyBillOperation _wayyBillOperation;
  Order _order;

  Future<bool> tryToBluetoothConnection(
    BuildContext context, {
    bool isManuel = false,
  }) async {
    /// Get selected device from shared cache
    var device = getBluetoothDevice();

    await _connectToBluetooth(device);

    if (await _bluetoothOperation.isConnected() && !isManuel) {
      ProductStateItems.toastService
          .showSuccessMessage(message: ProjectStrings.bluetoothConnected);
      return true;
    } else {
      if (!context.mounted) return false;

      /// Connect with manuel
      final manuelSelect = await BluetoothBottomSheet.show(context: context);
      if (manuelSelect != null) device = manuelSelect;
      if (await _connectToBluetooth(device)) {
        await saveBluetoothDevice(device);
        ProductStateItems.toastService
            .showSuccessMessage(message: ProjectStrings.bluetoothConnected);
      } else {
        ProductStateItems.toastService
            .showErrorMessage(message: ProjectStrings.bluetoothConnectFailed);
      }
    }
    return false;
  }

  Future<bool> _connectToBluetooth(BluetoothDevice? device) async {
    if (device == null) return false;
    return _bluetoothOperation.connect(device);
  }

  Future<void> printWaybill(BuildContext context) async {
    try {
      changeLoading();

      final result = await tryToBluetoothConnection(context);
      if (result) {
        //await saveOrdersToService();
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printQRcode(
          textToQR: 'Deneme çıktısı',
          width: 150,
          height: 150,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printCustom(
          message: state.addressInfo!,
          size: PrinterSize.boldMedium,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printCustom(
          message:
              '${state.wayyBill?.baslik?.cariUnvan}\n${state.wayyBill?.baslik?.cariAdresi}',
          size: PrinterSize.boldMedium,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printCustom(
          message: 'Teslimat adresi: Migros Ataşehir',
          size: PrinterSize.boldMedium,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printCustom(
          message: 'İrsaliye No: 23323123',
          size: PrinterSize.boldMedium,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printCustom(
          message: 'Tarih saat: ${DateTime.now().toString()}',
          size: PrinterSize.boldMedium,
          align: PrinterAlign.left,
        );
        await _bluetoothOperation.printNewLine();
        if (_order.orderDetails != null && _order.orderDetails!.isNotEmpty) {
          for (final orderDetail in _order.orderDetails!) {
            await _bluetoothOperation.printCustom(
              message: '${orderDetail.malzemeAdi}\n'
                  '${orderDetail.scans?.length ?? 0} ${orderDetail.birim}     '
                  '${orderDetail.totalScanAmount} '
                  '${orderDetail.totalScanAmount != '' ? 'KG' : ''}',
              size: PrinterSize.boldMedium,
              align: PrinterAlign.left,
            );
          }
        }
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printLeftRight(
          leftMessage: ProjectStrings.deliveredBy,
          rightMessage: ProjectStrings.recipient,
          size: PrinterSize.bold,
        );
        await _bluetoothOperation.printNewLine();
        await _bluetoothOperation.printNewLine();
      }
    } finally {
      changeLoading();
    }
  }

  Future<void> getWayyBill() async {
    try {
      changeLoading();
      final result =
          await _wayyBillOperation.getWayyBill(_order.siparisNumarasi!);
      if (result?.errorModel == null && result?.model != null) {
        emit(state.copyWith(wayyBill: result!.model));
      } else {
        _showError(
          result?.errorModel?.errorMessage ?? ProjectStrings.somethingError,
        );
      }
    } finally {
      changeLoading();
    }
  }

  /// Save order details to hive cache
  Future<void> saveOrdersToService() async {
    final result = await _orderOperation.saveScanOrders([_order]);

    /// Eğer backend'e veri başarılı bir şekilde kayıt edilmişse
    /// [_order.copyWith(synchronized: true)]
    /// ile veriyi synchronize olarak işaretle
    if (result?.errorModel == null && result?.model != null) {
      for (final siparisNo in result!.model!) {
        if (siparisNo.siparisNumarasi == _order.siparisNumarasi) {
          _order = _order.copyWith(synchronized: true);
        } else {
          _order = _order.copyWith(synchronized: false);
        }
      }
    }
    _orderCacheOperation.update(_order);
  }

  /// Show error when fetch data from db is error exists
  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Get Company address info from login response cache
  void getAddressInfo() {
    final address = _loginResponseCacheOperation.get(_userId!)?.addressInfo;
    emit(state.copyWith(addressInfo: address));
  }

  /// Get UserId from cache
  String? get _userId => _sharedCacheOperation.get(SharedKeys.userId);

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> saveBluetoothDevice(BluetoothDevice? device) async {
    if (device == null) return;
    const myDevice = '3d printer|12:BB:A3:22';
    final deviceInfo = '${device.name}|${device.address}';
    await _sharedCacheOperation.add(SharedKeys.bluetoothDevice, deviceInfo);
  }

  BluetoothDevice? getBluetoothDevice() {
    final deviceInfo =
        _sharedCacheOperation.get<String>(SharedKeys.bluetoothDevice);

    if (deviceInfo != null) {
      final parts = deviceInfo.split('|');
      if (parts.length == 2) {
        final name = parts[0];
        final address = parts[1];
        return BluetoothDevice(name, address);
      }
    }
    return null;
  }
}
