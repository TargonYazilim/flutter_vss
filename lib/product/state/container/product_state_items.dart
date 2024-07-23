import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';

class ProductStateItems {
  const ProductStateItems._();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ToastService get toastService =>
      ProductContainer.read<ToastService>();
}
