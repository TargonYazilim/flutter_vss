// The CacheManager class is an abstract class.

abstract class CacheManager {
  CacheManager({this.path});

  /// Make your cache initialization here.
  Future<void> init();

  /// Remove all cache.
  Future<void> remove();

  /// Register cache models to [Hive]
  void register();

  /// [path] is the path to the directory for example testing.
  final String? path;
}
