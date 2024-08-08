// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/order_operation.dart';
import 'package:flutter_vss/product/service/model/barcode/barcode.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:flutter_vss/product/service/model/order/order_detail.dart';
import 'package:flutter_vss/product/service/model/order/scan.dart';
import 'package:flutter_vss/product/state/base/base_cubit.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/barcode/custom_barcode_scanner.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:uuid/uuid.dart';

class OrderDetailViewModel extends BaseCubit<OrderDetailState> {
  OrderDetailViewModel({
    required CustomBarcodeScanner barcodeScanner,
    required OrderOperation orderOperation,
    required HiveCacheOperation<Order> orderCacheOperation,
    required HiveCacheOperation<Barcode> barcodeCacheOperation,
    required Order order,
  })  : _barcodeScanner = barcodeScanner,
        _orderCacheOperation = orderCacheOperation,
        _orderOperation = orderOperation,
        _barcodeCacheOperation = barcodeCacheOperation,
        _order = order,
        super(const OrderDetailState(isLoading: false));

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Hive cache operation for barcodes
  final HiveCacheOperation<Barcode> _barcodeCacheOperation;

  late final CustomBarcodeScanner _barcodeScanner;
  final OrderOperation _orderOperation;
  late final Order _order;

  Future<void> scanBarcode(int index) async {
    //updateBarcode(index, '210 kg');

    final result = await _barcodeScanner.scan(ScanMode.BARCODE);
    if (result.scanResult != null) {
      final barcode = _barcodeCacheOperation.get('2822404');
      if (barcode == null) {
        ProductStateItems.toastService
            .showErrorMessage(message: ProjectStrings.barcodeNotFound);
      } else {
        /*if (barcode.malzemeKodu != state.orderDetails?[index].malzemeKodu) {
          ProductStateItems.toastService
              .showErrorMessage(message: ProjectStrings.barcodesDoNotMatch);
        } else {*/
        ProductStateItems.toastService
            .showSuccessMessage(message: ProjectStrings.barcodeMatched);
        await updateBarcodeList(index, barcode.kilo);

        // final response = await _orderOperation.scanOrderBarcode(
        //   '2822404',
        //   _order.siparisNumarasi ?? '',
        //   state.orderDetails?[index].malzemeKodu ?? '',
        // );
        //}
      }
    } else {
      ProductStateItems.toastService
          .showInfoMessage(message: ProjectStrings.scanBarcodeFailed);
    }
  }

  Future<void> updateBarcodeList(int index, String? scanResult) async {
    if (scanResult == null) return;
    final newOrderDetailList = <OrderDetail>[...state.orderDetails ?? []];
    final scanList = newOrderDetailList[index].scans ?? [];

    /// Unique id for scan [Uuid().v4()]
    final scan = Scan(result: scanResult, scanId: const Uuid().v4());
    scanList.add(scan);

    // OrderDetail nesnesini güncellenmiş scans ile kopyala
    newOrderDetailList[index] =
        newOrderDetailList[index].copyWith(scans: scanList);

    /// OrderDetail to selected order
    _order.orderDetails = [...newOrderDetailList];

    print(_order.orderDetails?.first.scans);

    emit(state.copyWith(orderDetails: newOrderDetailList));
    await _saveOrderDetailsToCache(newOrderDetailList);
  }

  /// Save order details to hive cache
  Future<void> _saveOrderDetailsToCache(List<OrderDetail>? orderDetails) async {
    if (orderDetails == null) return;
    //print(jsonEncode(_order.toJson()));
    await _orderOperation.saveScanOrders([_order]);
    _orderCacheOperation.update(_order);
  }

  /// Get Orders from cache
  void getAllOrderDetailsFromCache() {
    final result = _orderCacheOperation.get(_order.cacheId);
    emit(state.copyWith(orderDetails: result?.orderDetails));
  }

  /// Show error when fetch data from db is error exists
  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

