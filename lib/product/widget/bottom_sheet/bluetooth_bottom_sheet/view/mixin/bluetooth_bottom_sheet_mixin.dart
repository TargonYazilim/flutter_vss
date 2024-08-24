import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view/bluetooth_bottom_sheet.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/bluetooth_bottom_sheet_view_model.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/state/bluetooth_bottom_sheet_base_state.dart';

mixin BluetoothBottomSheetMixin
    on BluetoothBottomSheetBaseState<BluetoothBottomSheet> {
  late final BluetoothBottomSheetViewModel _viewModel;

  BluetoothBottomSheetViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = BluetoothBottomSheetViewModel(
      bluetoothPrinterManager: bluetoothManager,
      productPermissionOperation: ProductStateItems.permissionHandler,
    );

    _viewModel.getDevices();
  }
}
