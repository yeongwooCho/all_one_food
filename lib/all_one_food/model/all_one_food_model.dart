class AllOneFoodModel {
  final int id; // primary key

  final String productInfo;
  final String productType;
  final List<String> taste;

  final String mainSentence;

  final int wishedPrice;
  final String consultingType;
  final DateTime consultingAt;

  AllOneFoodModel({
    required this.id,
    required this.productInfo,
    required this.productType,
    required this.taste,
    required this.mainSentence,
    required this.wishedPrice,
    required this.consultingType,
    required this.consultingAt,
  });

  AllOneFoodModel copyWith({
    int? id,
    String? productInfo,
    String? productType,
    List<String>? taste,
    String? mainSentence,
    int? wishedPrice,
    String? consultingType,
    DateTime? consultingAt,
  }) {
    return AllOneFoodModel(
      id: id ?? this.id,
      productInfo: productInfo ?? this.productInfo,
      productType: productType ?? this.productType,
      taste: taste ?? this.taste,
      mainSentence: mainSentence ?? this.mainSentence,
      wishedPrice: wishedPrice ?? this.wishedPrice,
      consultingType: consultingType ?? this.consultingType,
      consultingAt: consultingAt ?? this.consultingAt,
    );
  }
}
