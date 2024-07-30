import 'package:dio/dio.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/service/manager/enums/http_header_enum.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

class ProductNetworkInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await getToken();
    options.headers[HttpHeaderEnum.Authorization.name] = '${HttpHeaderEnum.Bearer.name} $token';
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  static Future<String?> getToken() async {
    if (userId == null) return null;
    return ProductStateItems.productCache.loginResponseCacheModel
        .get(userId!)
        ?.loginResponse
        .token;
  }

  static String? get userId =>
      ProductStateItems.productSharedCache.get(SharedKeys.userId);
}
