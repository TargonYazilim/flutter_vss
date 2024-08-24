import 'package:flutter_vss/product/cache/hive/hive_cache_manager.dart';
import 'package:flutter_vss/product/cache/product_cache.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/order/synchronize_cache_manager.dart';
import 'package:flutter_vss/product/service/manager/order/synchronize_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:flutter_vss/product/utility/bluetooth/bluetooth_printer_manager.dart';
import 'package:flutter_vss/product/utility/bluetooth/bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_manager.dart';
import 'package:flutter_vss/product/utility/bluetooth/interface/i_bluetooth_printer_operation.dart';
import 'package:flutter_vss/product/utility/permission_handler/interface/product_permission_operation.dart';
import 'package:flutter_vss/product/utility/permission_handler/product_permission_handler.dart';
import 'package:flutter_vss/product/utility/toast/toast_manager.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';
import 'package:get_it/get_it.dart';

// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();

  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerSingleton<SharedCacheOperation>(SharedCacheOperation())
      ..registerLazySingleton<ToastService>(ToastManager.new)
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new)
      ..registerLazySingleton<ISynchronizeCacheOperation>(
        SynchronizeCacheManager.new,
      )
      ..registerLazySingleton<IBluetoothPrinterManager>(
        BluetoothPrinterManager.new,
      )
      ..registerLazySingleton<ProductPermissionOperation>(
        ProductPermissionHandler.new,
      )
      ..registerLazySingleton<IBluetoothPrinterOperation>(
        BluetoothPrinterOperation.new,
      );
  }

  /// Read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
