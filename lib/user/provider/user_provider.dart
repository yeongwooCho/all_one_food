import 'package:all_one_food/user/model/business_model.dart';
import 'package:all_one_food/user/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModelBase> {
  UserStateNotifier() : super(UserModelLoading()) {
    initItems();
  }

  void initItems() {
    state = UserModel(
      id: 1,
      email: 'asdf@naver.com',
      username: 'zxcv',
      password: 'zxcv',
      name: '홍석표',
      phone: '01012341234',
      profileImage: 'asset/img/logo/logo.png',
      business: BusinessModel(
        id: 1,
        number: 7703819284,
        name: '홍석표',
        certification: '사업자 등록증.pdf',
      ),
    );
  }
}
