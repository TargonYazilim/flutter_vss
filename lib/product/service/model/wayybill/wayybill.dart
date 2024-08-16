import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_vss/product/service/model/wayybill/wayybill_detail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wayybill.g.dart';

@JsonSerializable()
class WayyBill extends IDioNexusNetworkModel<WayyBill> {
  int? errorCode;
  String? result;
  IrsaliyeDetail? baslik;

  WayyBill({
    this.errorCode,
    this.result,
    this.baslik,
  });

  @override
  WayyBill fromJson(Map<String, dynamic> json) => WayyBill.fromJson(json);

  factory WayyBill.fromJson(Map<String, dynamic> json) =>
      _$WayyBillFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WayyBillToJson(this);

  WayyBill copyWith({
    int? errorCode,
    String? result,
    IrsaliyeDetail? baslik,
  }) {
    return WayyBill(
      errorCode: errorCode ?? this.errorCode,
      result: result ?? this.result,
      baslik: baslik ?? this.baslik,
    );
  }
}
