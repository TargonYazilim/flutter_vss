import 'package:flutter_vss/product/state/container/product_state_container.dart';
import 'package:flutter_vss/product/state/view_model/product_view_model.dart';

class ProductStateItems {
  const ProductStateItems._();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
}
