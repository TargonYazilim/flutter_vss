/// Hive cache register adapter id
library;

enum HiveAdapterId {
  login(10),
  order(30),
  orderDetail(50),
  scan(70),
  barcode(90);

  final int value;
  const HiveAdapterId(this.value);
}
