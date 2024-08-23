import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/settings/view/settings_view.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';

abstract class SettingsViewModel extends State<SettingsView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController baseUrlController;
  late final TextEditingController companyNoController;

  late final SharedCacheOperation _sharedCacheOperation;

  ValueNotifier<bool> isSettingsEditable = ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _sharedCacheOperation = ProductStateItems.productSharedCache;

    baseUrlController = TextEditingController(text: baseUrl);
    companyNoController = TextEditingController(text: companyNo);

    isSettingsEditable.value = userId?.isEmpty ?? true;
  }

  @override
  void dispose() {
    super.dispose();

    baseUrlController.dispose();
    companyNoController.dispose();
  }

  /// Save base url and company no to cache
  Future<void> save(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    if (isLoading.value) return;
    changeLoading();
    await _sharedCacheOperation.add(SharedKeys.baseUrl, baseUrlController.text);
    await _sharedCacheOperation.add(
      SharedKeys.companyNo,
      companyNoController.text,
    );
    changeLoading();
    if (!context.mounted) return;
    Navigator.of(context).pop(true);
  }

  /// Get base url from cache
  String? get baseUrl => _sharedCacheOperation.get(SharedKeys.baseUrl);

  /// Get company no from cache
  String? get companyNo => _sharedCacheOperation.get(SharedKeys.companyNo);

  /// Get company no from cache
  String? get userId => _sharedCacheOperation.get(SharedKeys.userId);

  /// Change loading for view
  void changeLoading() => isLoading.value = !isLoading.value;
}
