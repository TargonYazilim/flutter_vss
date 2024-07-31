import 'dart:io';

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/init/config/app_environment.dart';
import 'package:flutter_vss/product/service/manager/product_network_interceptor.dart';

final class ProductNetworkManager extends DioNexusManager {
  ProductNetworkManager.base()
      : super(
          interceptor: ProductNetworkInterceptor(),
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            },
          ),
          printLogsDebugMode: false,
        );

  /// Error handler
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(error);
        },
      ),
    );
  }
}
