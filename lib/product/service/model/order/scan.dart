import 'package:dio_nexus/dio_nexus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_vss/product/cache/core/cache_model.dart';
import 'package:flutter_vss/product/widget/product_listview.dart/sub_listview_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scan.g.dart';

@JsonSerializable()
class Scan extends IDioNexusNetworkModel<Scan>
    with EquatableMixin, CacheModel<Scan>, SubListviewModel<Scan> {
  Scan({
    this.id,
    this.result,
    this.scanId,
    this.deleted = false,
  });

  Scan.empty();

  factory Scan.fromJson(Map<String, dynamic> json) => _$ScanFromJson(json);
  int? id;
  String? scanId;
  String? result;
  bool? deleted;

  @override
  Scan fromJson(Map<String, dynamic> json) => Scan.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ScanToJson(this);

  @override
  List<Object?> get props => [result, scanId, deleted];

  Scan copyWith({
    int? id,
    String? result,
    String? scanId,
    bool? deleted,
  }) {
    return Scan(
      id: id ?? this.id,
      result: result ?? this.result,
      scanId: scanId ?? this.scanId,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  String get cacheId => id.toString();

  @override
  String get title => result ?? '';
}
