import 'package:all_one_food/product/model/product_model.dart';

class CartModel {
  final String id;
  final ProductModel productModel;
  final int amount;
  final bool isSelected;

  CartModel({
    required this.id,
    required this.productModel,
    required this.amount,
    required this.isSelected,
  });

  CartModel copyWith({
    String? id,
    ProductModel? productModel,
    int? amount,
    bool? isSelected,
  }) {
    return CartModel(
      id: id ?? this.id,
      productModel: productModel ?? this.productModel,
      amount: amount ?? this.amount,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
