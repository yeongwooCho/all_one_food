import 'package:all_one_food/user/model/address_model.dart';
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
      address: AddressModel(
        id: 1,
        name: '홍석표',
        phone: '010-1234-1234',
        address: '서울특별시 종로구 세종대로 172',
        detailAddress: '103동 502호',
        memo: '부재시 경비실에 맡겨주세요.',
      ),
    );
  }
}
