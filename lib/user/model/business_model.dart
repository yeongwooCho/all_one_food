class BusinessModel {
  final int id; // primary key
  final int number;
  final String name;
  final String certification;

  BusinessModel({
    required this.id,
    required this.number,
    required this.name,
    required this.certification,
  });

  BusinessModel copyWith({
    int? id,
    int? number,
    String? name,
    String? certification,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
      certification: certification ?? this.certification,
    );
  }
}
