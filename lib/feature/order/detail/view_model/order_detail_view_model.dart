// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/order/detail/view_model/state/order_detail_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
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
    required HiveCacheOperation<Order> orderCacheOperation,
    required HiveCacheOperation<Barcode> barcodeCacheOperation,
    required Order order,
  })  : _barcodeScanner = barcodeScanner,
        _orderCacheOperation = orderCacheOperation,
        _barcodeCacheOperation = barcodeCacheOperation,
        _order = order,
        super(const OrderDetailState(isLoading: false, showButton: false));

  /// Hive cache operation for orders
  final HiveCacheOperation<Order> _orderCacheOperation;

  /// Hive cache operation for barcodes
  final HiveCacheOperation<Barcode> _barcodeCacheOperation;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  late final CustomBarcodeScanner _barcodeScanner;
  late Order _order;

  Future<void> scanBarcode(int index) async {
    final bar = Barcode(
      barkod: '2822404',
      kilo: '210 kg',
      birim: 'ADET',
      malzemeKodu: 'T103',
    );
    await updateBarcodeList(index, bar.kilo);

    /*final result = await _barcodeScanner.scan(ScanMode.BARCODE);
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
    }*/
  }

  Future<void> updateBarcodeList(int index, String? scanResult) async {
    if (_order.orderDetails?[index].birim == 'KG' &&
        (_order.orderDetails != null &&
            _order.orderDetails![index].scans != null &&
            _order.orderDetails![index].scans!.isNotEmpty)) {
      ProductStateItems.toastService
          .showInfoMessage(message: ProjectStrings.barcodeLimit);
      return;
    }
    try {
      changeOperationLoading();

      final newOrderDetailList =
          List<OrderDetail>.from(state.orderDetails ?? []);

      if (scanResult != null) {
        final scanList = List<Scan>.from(newOrderDetailList[index].scans ?? []);

        /// Unique id for scan [Uuid().v4()]
        final generatedId = const Uuid().v4();
        final scan = Scan(result: scanResult, scanId: generatedId);
        scanList.add(scan);

        // OrderDetail nesnesini güncellenmiş scans ile kopyala
        newOrderDetailList[index] =
            newOrderDetailList[index].copyWith(scans: scanList);

        /// OrderDetail to selected order
        _order = _order.copyWith(
          orderDetails: List<OrderDetail>.from(newOrderDetailList),
        );
      }

      emit(state.copyWith(orderDetails: _order.orderDetails));
      emit(state.copyWith(showButton: _anyScans()));

      await _saveOrderDetailsToCache();
    } finally {
      changeOperationLoading();
    }
  }

  Future<void> deleteScanBarcode(Scan scan, int index, int innerIndex) async {
    try {
      changeOperationLoading();

      if (_order.synchronized == false) {
        final newOrderDetailList =
            List<OrderDetail>.from(state.orderDetails ?? []);

        final updatedScans =
            List<Scan>.from(newOrderDetailList[index].scans ?? [])
              ..removeAt(innerIndex);

        newOrderDetailList[index] =
            newOrderDetailList[index].copyWith(scans: updatedScans);

        _order = _order.copyWith(
          orderDetails: List<OrderDetail>.from(newOrderDetailList),
        );

        emit(state.copyWith(orderDetails: _order.orderDetails));
        emit(state.copyWith(showButton: _anyScans()));

        await _saveOrderDetailsToCache();
        ProductStateItems.toastService.showSuccessMessage(
          message: ProjectStrings.removeBarcodeScanSuccess,
        );
      } else {
        ProductStateItems.toastService
            .showErrorMessage(message: ProjectStrings.removeBarcodeScanFiled);
      }
    } finally {
      changeOperationLoading();
    }
  }

  /// Save order details to hive cache
  Future<void> _saveOrderDetailsToCache() async {
    _order = _order.copyWith(synchronized: false);
    _orderCacheOperation.update(_order);
  }

  /// Get Orders from cache
  void getAllOrderDetailsFromCache() {
    final result = _orderCacheOperation.get(_order.cacheId);

    emit(state.copyWith(orderDetails: result?.orderDetails));
    emit(state.copyWith(showButton: _anyScans()));
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

  bool _anyScans() {
    if (state.orderDetails == null) return false;
    for (final detail in state.orderDetails!) {
      if (detail.scans != null && detail.scans!.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  void pushToWayybillView(BuildContext context) {
    /// Change order details with cache order detail
    _order.orderDetails = state.orderDetails;
    context.router.push(WayyBillRoute(order: _order));
  }

  /// Operation loading
  void changeOperationLoading() {
    isLoading.value = !isLoading.value;
  }
}
