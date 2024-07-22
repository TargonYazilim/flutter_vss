class SevkiyatModel {
  SevkiyatModel(
      {required this.company,
      required this.address,
      required this.code,
      required this.details});

  final String? company;
  final String? address;
  final String? code;
  final List<String> details;

  static List<SevkiyatModel> dummy() {
    return [
      SevkiyatModel(
          company: 'Migros',
          code: '1223323113',
          address: 'Ataşehir MM',
          details: [
            'Bütün Piliç - 6 Koli - 0 KG',
            'Parça But - 40 Adet - 0 KG',
            'Tavuk Kanat - 3 Koli - 0 KG',
          ]),
      SevkiyatModel(
        company: 'Migros',
        code: '3321123321',
        address: 'Güngören',
        details: [
          'Bütün Piliç - 6 Koli - 0 KG',
          'Parça But - 40 Adet - 0 KG',
          'Tavuk Kanat - 3 Koli - 0 KG',
        ],
      ),
      SevkiyatModel(
        company: 'Migros',
        code: '5345353344',
        address: 'Merter',
        details: [
          'Bütün Piliç - 6 Koli - 0 KG',
          'Parça But - 40 Adet - 0 KG',
          'Tavuk Kanat - 3 Koli - 0 KG',
        ],
      ),
      SevkiyatModel(
        company: 'Carrefour',
        code: '551233312',
        address: 'Cadde 3M',
        details: [
          'Bütün Piliç - 6 Koli - 0 KG',
          'Parça But - 40 Adet - 0 KG',
          'Tavuk Kanat - 3 Koli - 0 KG',
        ],
      ),
    ];
  }
}
