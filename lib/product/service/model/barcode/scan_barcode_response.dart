import 'package:dio_nexus/dio_nexus.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scan_barcode_response.g.dart';

@JsonSerializable()
class ScanBarcodeResponse extends IDioNexusNetworkModel<ScanBarcodeResponse> {
  ScanBarcodeResponse({
    this.siparisNumarasi,
  });

  factory ScanBarcodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanBarcodeResponseFromJson(json);
  String? siparisNumarasi;

  @override
  ScanBarcodeResponse fromJson(Map<String, dynamic> json) =>
      ScanBarcodeResponse.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScanBarcodeResponseToJson(this);

  ScanBarcodeResponse copyWith({
    String? siparisNumarasi,
  }) {
    return ScanBarcodeResponse(
      siparisNumarasi: siparisNumarasi ?? this.siparisNumarasi,
    );
  }
}
