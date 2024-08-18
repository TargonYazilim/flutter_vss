// ignore_for_file: public_member_api_docs

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/splash/view_model/state/splash_state.dart';
import 'package:flutter_vss/product/service/manager/order/synchronize_cache_operation.dart';

final class SplashViewModel extends Cubit<SplashState> {
  SplashViewModel(
      {required ISynchronizeCacheOperation synchronizeCacheOperation})
      : _synchronizeCacheOperation = synchronizeCacheOperation,
        super(const SplashState(isLoading: false));

  ISynchronizeCacheOperation _synchronizeCacheOperation;

  Future<void> synchronizeDatas() async {
    await _synchronizeCacheOperation.synchronizeOrders();
    await _synchronizeCacheOperation.synchronizeBarcodes();
  }
}
