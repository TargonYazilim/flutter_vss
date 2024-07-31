import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:kartal/kartal.dart';

final class OrderCacheModel with CacheModel {
  OrderCacheModel({required this.order});
  OrderCacheModel.empty() : order = Order();

  final Order order;

  @override
  OrderCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<Order>('Json cannot be null');
      return this;
    }
    return copyWith(order: Order.fromJson(jsonMap));
  }

  @override
  String get id => order.siparisLogicalRef.toString();

  @override
  Map<String, dynamic> toJson() => order.toJson();

  OrderCacheModel copyWith({Order? order}) {
    return OrderCacheModel(
      order: order ?? this.order,
    );
  }
}
