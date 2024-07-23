import 'package:flutter_vss/product/widget/product_listview.dart/base_listview_model.dart';

class TransportModel extends BaseListviewModel<TransportModel> {
  TransportModel(
      {required this.company,
      required this.address,
      required this.code,
      required this.details});

  final String? company;
  final String? address;
  final String? code;
  final List<TransportDetail> details;

  static List<TransportModel> dummy() {
    return [
      TransportModel(
          company: 'Migros',
          code: '1223323113',
          address: 'Ataşehir MM',
          details: [
            TransportDetail(
                name: 'Bütün Piliç', piece: '6 Koli', amount: '0 KG'),
            TransportDetail(
                name: 'Parça But', piece: '40 Adet', amount: '0 KG'),
            TransportDetail(
                name: 'Tavuk Kanat', piece: '3 Koli', amount: '0 KG'),
          ]),
      TransportModel(
        company: 'Migros',
        code: '3321123321',
        address: 'Güngören',
        details: [
          TransportDetail(name: 'Bütün Piliç', piece: '6 Koli', amount: '0 KG'),
          TransportDetail(name: 'Parça But', piece: '40 Adet', amount: '0 KG'),
          TransportDetail(name: 'Tavuk Kanat', piece: '3 Koli', amount: '0 KG'),
        ],
      ),
      TransportModel(
        company: 'Migros',
        code: '5345353344',
        address: 'Merter',
        details: [
          TransportDetail(name: 'Bütün Piliç', piece: '6 Koli', amount: '0 KG'),
          TransportDetail(name: 'Parça But', piece: '40 Adet', amount: '0 KG'),
          TransportDetail(name: 'Tavuk Kanat', piece: '3 Koli', amount: '0 KG'),
        ],
      ),
      TransportModel(
        company: 'Carrefour',
        code: '551233312',
        address: 'Cadde 3M',
        details: [
          TransportDetail(name: 'Bütün Piliç', piece: '6 Koli', amount: '0 KG'),
          TransportDetail(name: 'Parça But', piece: '40 Adet', amount: '0 KG'),
          TransportDetail(name: 'Tavuk Kanat', piece: '3 Koli', amount: '0 KG'),
        ],
      ),
    ];
  }

  @override
  String get title => '$company - $code - $address';
}

class TransportDetail extends BaseListviewModel<TransportDetail> {
  TransportDetail({
    required this.name,
    required this.piece,
    required this.amount,
  });

  final String? name;
  final String? piece;
  final String? amount;

  @override
  String get title => '$name - $piece - $amount';
}
