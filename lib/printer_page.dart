import 'package:auto_route/auto_route.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrinterView extends StatefulWidget {
  const PrinterView({super.key});

  @override
  State<PrinterView> createState() => _PrinterViewState();
}

class _PrinterViewState extends State<PrinterView> {
  List<BluetoothDevice> _devices = [];
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  String _devicesMsg = "";
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => initPrinter(),
    );
  }

  Future<void> initPrinter() async {
    await bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen(
      (val) {
        if (!mounted) return;
        setState(() {
          _devices = val;
        });
        if (_devices.isEmpty) {
          setState(() {
            _devicesMsg = "Cihaz bulunamadı";
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select printer'),
        ),
        body: _devices.isEmpty
            ? Center(
                child: Text(_devicesMsg ?? ''),
              )
            : ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(_devices[index].name!),
                    subtitle: Text(_devices[index].address!),
                    onTap: () {
                      
                    },
                  );
                },
              ));
  }
}

/*


  Widget _body2(BuildContext context) {
    return StreamBuilder<List<BluetoothDevice>>(
      stream: BluetoothPrint.instance.scanResults,
      initialData: [],
      builder: (c, snapshot) => Column(
        children: snapshot.data!
            .map((d) => ListTile(
                  title: Text(d.name ?? ''),
                  subtitle: Text(d.address ?? ''),
                  onTap: () async {
                    setState(() {
                      _device = d;
                    });
                  },
                  trailing: _device != null && _device.address == d.address
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : null,
                ))
            .toList(),
      ),
    );
  }

*/