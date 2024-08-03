import 'package:flutter/material.dart';
import 'package:flutter_vss/product/cache/core/cache_manager.dart';
import 'package:flutter_vss/product/cache/core/cache_register.dart';
import 'package:flutter_vss/product/cache/hive/hive_adater_id.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/service/model/order/order.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

/// The HiveCacheManager class is an implementation  of the CacheManager class.
final class HiveCacheManager extends CacheManager {
  /// [path] is the path of the directory
  /// where the Hive database files are stored.
  HiveCacheManager({super.path});

  @override
  Future<void> init() async {
    final documentPath =
        path ?? (await getApplicationDocumentsDirectory()).path;

    await Hive.initFlutter(documentPath);
  }

  @override
  Future<void> remove() async {
    final items = <String>[
      LoginResponse.empty().toString(),
      Order.empty().toString(),
    ];
    try {
      for (final item in items) {
        if (Hive.isBoxOpen(item)) {
          final box = Hive.box<dynamic>(item);
          await box.close();
        }
        await Hive.deleteBoxFromDisk(item);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void register() {
    Hive
      ..registerAdapter<LoginResponse>(
        CacheRegisterAdapter<LoginResponse>(
          LoginResponse.fromJson,
          HiveAdapterId.login,
        ),
      )
      ..registerAdapter<Order>(
        CacheRegisterAdapter<Order>(
          Order.fromJson,
          HiveAdapterId.order,
        ),
      );
  }
}
