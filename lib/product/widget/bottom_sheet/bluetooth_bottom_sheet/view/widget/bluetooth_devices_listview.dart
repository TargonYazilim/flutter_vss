part of '../bluetooth_bottom_sheet.dart';

class BluetoothDevicesListview extends StatelessWidget {
  const BluetoothDevicesListview({required this.devices, super.key});

  final List<BluetoothDevice>? devices;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).pop(devices![index]);
          },
          title: Text(devices![index].name!),
        );
      },
    );
  }
}
