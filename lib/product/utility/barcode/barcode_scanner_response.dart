final class BarcodeScannerResponse {
  BarcodeScannerResponse(
      {required this.scanResult, required this.errorMessage});
      
  final String? scanResult;
  final String? errorMessage;
}
