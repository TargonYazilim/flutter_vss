import 'package:flutter_vss/product/cache/core/cache_model.dart';

abstract class CacheOperation<T extends CacheModel<T>> {
  void add(T item);
  void addAll(List<T> items);
  void remove(String id);

  List<T> getAll();
  T? get(String id);
}
