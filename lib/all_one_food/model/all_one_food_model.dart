class AllOneFoodModel {
  final int id; // primary key
  final String shortInfo;
  final String snack;
  final List<String> value;
  final int wishedPrice;
  final String consultingType;
  final DateTime consultingAt;

  AllOneFoodModel({
    required this.id,
    required this.shortInfo,
    required this.snack,
    required this.value,
    required this.wishedPrice,
    required this.consultingType,
    required this.consultingAt,
  });

  AllOneFoodModel copyWith({
    int? id,
    String? shortInfo,
    String? snack,
    List<String>? value,
    int? wishedPrice,
    String? consultingType,
    DateTime? consultingAt,
  }) {
    return AllOneFoodModel(
      id: id ?? this.id,
      shortInfo: shortInfo ?? this.shortInfo,
      snack: snack ?? this.snack,
      value: value ?? this.value,
      wishedPrice: wishedPrice ?? this.wishedPrice,
      consultingType: consultingType ?? this.consultingType,
      consultingAt: consultingAt ?? this.consultingAt,
    );
  }
}
