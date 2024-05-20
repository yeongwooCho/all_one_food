import 'package:all_one_food/common/utils/data_utils.dart';
import 'package:all_one_food/product/model/product_model.dart';
import 'package:all_one_food/product/provider/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRandomProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  final selectedCategory = ref.watch(categorySelectedProvider);

  final randomProducts =
      DataUtils.getRandomShuffledList<ProductModel>(products);
  return randomProducts;
});

final productPreferProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);

  final pairProducts = DataUtils.getRandomShuffledList<ProductModel>(products);
  return pairProducts.take(2).toList();
});

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
    final productNames = [
      '치즈 왕관 팝콘',
      '꿀맛 크림 와퍼 샌드',
      "컬러풀 데일리 매크롱 세트",
      "골든 칩 크리스피 딜라이트",
      "컬러풀 캔디 트로피칼 믹스",
      "피트니스 고섬유 바",
      "초코칩 아이스크림 쿠키",
      "블랙 화이트 크림 샌드위치",
      "트로피칼 프루티 젤리 웜",
      "골든 크런치 호두 스낵",
      "허브 & 칠리 프로틴 스낵",
      "피칸 초코칩 브레드"
    ];

    final prices = [
      4300,
      2700,
      3400,
      1480,
      2300,
      5300,
      3400,
      2200,
      1400,
      2200,
      3300,
      2300,
    ];

    return List.generate(
      productNames.length,
      (index) => ProductModel(
        id: index,
        name: productNames[index],
        price: prices[index],
        sale: index + 10,
        mainImageUrl: 'asset/img/product/$index.png',
        detailImageUrls: [
          'asset/img/product/$index/0.png',
          'asset/img/product/$index/1.png',
          'asset/img/product/$index/2.png',
          'asset/img/product/$index/3.png',
        ],
        isLike: true,
        categoryIds: [1, 2, 3],
      ),
    );
  }
}
