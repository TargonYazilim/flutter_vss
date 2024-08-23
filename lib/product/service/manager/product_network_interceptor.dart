import 'package:dio/dio.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/init/config/app_environment.dart';
import 'package:flutter_vss/product/service/manager/enums/http_header_enum.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

class ProductNetworkInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (baseUrl != null) {

      /// Add base url base options chosen by the user.
      options.baseUrl = 'http://$baseUrl/api/';

      /// Set token bu auth header
      final token = await getToken();
      options.headers[HttpHeaderEnum.Authorization.name] =
          '${HttpHeaderEnum.Bearer.name} $token';

      /// If the token is null, then include x-api-key to header
      if (token == null) {
        options.headers[HttpHeaderEnum.XApiKey.value] =
            AppEnvironmentItems.apiKey.value;
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  static Future<String?> getToken() async {
    if (userId == null) return null;
    return ProductStateItems.productCache.loginResponseCacheModel
        .get(userId!)
        ?.token;
  }

  /// Get userId from cache
  static String? get userId =>
      ProductStateItems.productSharedCache.get(SharedKeys.userId);

  static String? get baseUrl =>
      ProductStateItems.productSharedCache.get(SharedKeys.baseUrl);
}
