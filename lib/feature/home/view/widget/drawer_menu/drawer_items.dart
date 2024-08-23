import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/navigation/app_router.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:flutter_vss/product/utility/constants/project_durations.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/widget/dialog/question_dialog.dart';
import 'package:kartal/kartal.dart';

class DrawerMenuItem {
  DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.color,
    required this.callback,
  });

  final IconData icon;
  final String title;
  final Color color;
  final AsyncCallback callback;
}

class DrawerMenuItems {
  DrawerMenuItems._();

  static bool _synchronized = true;

  static List<DrawerMenuItem> getItems(BuildContext context) {
    return [
      DrawerMenuItem(
        icon: Icons.settings,
        title: ProjectStrings.settings,
        color: context.general.appTheme.colorScheme.onSurface,
        callback: () async {
          unawaited(context.router.push(const SettingsRoute()));
        },
      ),
      DrawerMenuItem(
        icon: Icons.sync_sharp,
        title: ProjectStrings.synchronizeDatas,
        callback: _synchronize,
        color: context.general.appTheme.colorScheme.onSurface,
      ),
      DrawerMenuItem(
        icon: Icons.logout_rounded,
        title: ProjectStrings.logOut,
        callback: () async => _logout(context),
        color: context.general.appTheme.colorScheme.error,
      ),
    ];
  }

  /// Sync cache data with Api
  static Future<void> _synchronize() async {
    if (!_synchronized) {
      ProductStateItems.toastService
          .showErrorMessage(message: ProjectStrings.toManyRequest);
      return;
    }
    _synchronized = false;
    await ProductStateItems.synchronizeCache.synchronizeOrders();
    await ProductStateItems.synchronizeCache.synchronizeBarcodes();
    ProductStateItems.toastService
        .showInfoMessage(message: ProjectStrings.datasSynchronized);
    await Future<void>.delayed(
      const ProjectDurations.extraLargeDuration(),
    ).then((value) => _synchronized = true);
  }

  /// Logout
  static Future<void> _logout(BuildContext context) async {
    final result = await QuestionDialog.show(
      context: context,
      title: ProjectStrings.areYouSureForLogout,
    );
    if (!(result ?? false)) return;

    /// Synchronize before logout
    await ProductStateItems.synchronizeCache.synchronizeOrders();

    /// Clear all cache datas
    await ProductStateItems.productCache.loginResponseCacheModel.clear();
    await ProductStateItems.productCache.orderCacheModel.clear();
    await ProductStateItems.productSharedCache.clearByKeys([SharedKeys.userId]);
    if (!context.mounted) return;
    unawaited(context.router.replace(const SplashRoute()));
  }
}
