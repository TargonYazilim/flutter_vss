/// Synchronize for barcodes and orders
abstract class ISynchronizeCacheOperation {
  Future<void> synchronizeOrders();
  Future<void> synchronizeBarcodes();
}
