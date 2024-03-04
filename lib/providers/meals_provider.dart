import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;  //Dùng Provider khi có dữ liệu giả tĩnh, một list không bao giờ thay đổi
});