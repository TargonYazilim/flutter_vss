// ignore_for_file: public_member_api_docs

enum ProductServicePath {
  login('$_user/Login'),
  getOrder('$_order/GetOrder'),
  getBarcodes('$_barcode/GetBarcodes'),
  saveScanOrder('$_order/ScanOrderBarcode'),
  removeBarcodeScan('$_scan/DeleteScan');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String query) {
    return '$value/$query';
  }

  /// Api UserProfile name
  static const String _user = 'Users/';
  static const String _order = 'Order/';
  static const String _barcode = 'Barcode/';
  static const String _scan = 'Scan/';
}
