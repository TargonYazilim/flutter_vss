import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/base/bottom_sheet_base.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view/mixin/bluetooth_bottom_sheet_mixin.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/bluetooth_bottom_sheet_view_model.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/state/bluetooth_bottom_sheet_base_state.dart';
import 'package:flutter_vss/product/widget/bottom_sheet/bluetooth_bottom_sheet/view_model/state/bluetooth_bottom_sheet_state.dart';

part 'widget/bluetooth_devices_listview.dart';

class BluetoothBottomSheet extends StatefulWidget {
  const BluetoothBottomSheet({super.key});

  /// Show base bottom sheet
  static Future<BluetoothDevice?> show({required BuildContext context}) {
    return BottomSheetBase.show<BluetoothDevice>(
      context: context,
      builder: (context) => const BluetoothBottomSheet(),
    );
  }

  @override
  State<BluetoothBottomSheet> createState() => _BluetoothBottomSheetState();
}

class _BluetoothBottomSheetState
    extends BluetoothBottomSheetBaseState<BluetoothBottomSheet>
    with BluetoothBottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: _body(),
    );
  }

  Stack _body() {
    return Stack(
      children: [
        Padding(
          padding: const ProjectPadding.allNormal(),
          child: BlocBuilder<BluetoothBottomSheetViewModel,
              BluetoothBottomSheetState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.devices?.isEmpty ?? true) {
                return const Center(
                  child: Text(ProjectStrings.noBluetoothDevices),
                );
              }
              return BluetoothDevicesListview(devices: state.devices);
            },
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
