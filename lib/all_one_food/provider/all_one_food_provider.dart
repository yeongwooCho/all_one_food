import 'package:all_one_food/all_one_food/model/all_one_food_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allOneFoodProvider =
    StateNotifierProvider<AllOneFoodStateNotifier, AllOneFoodModel>(
  (ref) => AllOneFoodStateNotifier(),
);

class AllOneFoodStateNotifier extends StateNotifier<AllOneFoodModel> {
  AllOneFoodStateNotifier()
      : super(
          AllOneFoodModel(
            id: 1,
            shortInfo: '비건을 위한 다이어트 단백질 에너지바',
            snack: '에너지바',
            value: ['고소한 맛', '달콤한 맛'],
            wishedPrice: 1200,
            consultingType: '온라인 상담',
            consultingAt: DateTime(2024, 06, 15, 14, 00),
          ),
        );
}
