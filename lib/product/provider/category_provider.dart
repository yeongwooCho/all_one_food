import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorySelectedProvider = StateProvider<String>(
  (ref) => '전체',
);

final categoriesProvider = StateProvider<List<String>>(
  (ref) => [
    '전체',
    '스낵류',
    '베이커리',
    '밀키트',
    '냉동식품',
    '통조림',
    '빙과류',
    '음료',
    '기타',
  ],
);
