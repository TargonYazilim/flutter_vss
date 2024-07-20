import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';

// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();

  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt.registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  /// Read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
