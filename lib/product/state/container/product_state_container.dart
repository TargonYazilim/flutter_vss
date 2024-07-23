import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:flutter_vss/product/utility/toast/toast_manager.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';
import 'package:get_it/get_it.dart';

// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();

  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt.registerLazySingleton<ProductViewModel>(ProductViewModel.new);
    _getIt.registerLazySingleton<ToastService>(ToastManager.new);
    _getIt.registerLazySingleton<ToastManager>(ToastManager.new);
  }

  /// Read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
