class PaymentModel {
  final String id;
  final String type;
  final String status;
  final int price;
  final DateTime createAt;

  PaymentModel({
    required this.id,
    required this.type,
    required this.status,
    required this.price,
    required this.createAt,
  });
}
