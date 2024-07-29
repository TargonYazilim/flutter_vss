import 'package:flutter_vss/product/cache/product_cache.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/manager/product_service_manager.dart';
import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';

class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ToastService get toastService => ProductContainer.read<ToastService>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();

  static SharedCacheOperation get productSharedCache =>
      ProductContainer.read<SharedCacheOperation>();
}
