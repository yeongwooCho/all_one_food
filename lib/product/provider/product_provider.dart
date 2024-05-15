import 'package:all_one_food/common/const/image_path.dart';
import 'package:all_one_food/product/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailProvider = Provider.family<ProductModel, int>((ref, id) {
  final product =
      ref.watch(productProvider).firstWhere((element) => element.id == id);
  return product;
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required int productId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == productId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<ProductModel> getItems() {
    return List.generate(
      10,
      (index) => ProductModel(
        id: index,
        name: '하이하이$index 이다.}',
        price: 12345,
        sale: index + 10,
        mainImageUrl: ImagePath.logo,
        detailImageUrls: [ImagePath.logo, ImagePath.logo],
        isLike: true,
        categoryIds: [1, 2, 3],
      ),
    );
  }
}
