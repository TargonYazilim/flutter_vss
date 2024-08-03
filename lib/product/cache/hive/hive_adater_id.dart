/// Hive cache register adapter id

enum HiveAdapterId {
  login(10),
  order(100);

  final int value;
  const HiveAdapterId(this.value);
}
