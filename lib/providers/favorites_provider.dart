import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //List<Meal> là dữ liệu danh sách các bữa ăn
  FavoriteMealsNotifier() : super([]);
  // chúng ta thêm một danh sách trình khởi tạo như vậy bằng cách thêm dấu hai chấm sau danh sách tham số hàm tạo.
  //Khi sử dụng StateNotifier, ta không được phép chỉnh sửa giá trị hiện có trong bộ nhớ. Thay vào đó, ta phải luôn tạo một cái mới.
  bool toggleMealFavoriteStatus(Meal meal) {
    //không boa giờ sửa giá trị được quản lí bởi trình thông báo này
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      //where chúng ta lọc một danh sách và chúng ta nhận được một danh sách mới hoặc một lần lặp mới mà chúng ta có thể chuyển đổi thành danh sách bằng cách gọi đến danh sách.
      return false;
    } else {
      state = [...state, meal]; //... toán tử mở rộng
      /*Vì vậy, trong trường hợp này, trạng thái là một danh sách các bữa ăn để lấy ra tất cả các phần tử được lưu trữ trong danh
      sách đó và thêm chúng dưới dạng các phần tử riêng lẻ vào danh sách mới này. */
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
  // ta nên thêm phần <FavoriteMealsNotifier, List<Meal>> để nhận được hỗ trợ kiểu tốt hơn trong phần còn lại của ứng dụng.
});
/*Nếu bạn có dữ liệu phức tạp hơn, dữ liệu đó sẽ thay đổi trong một số trường hợp nhất định,
thì Provider là lựa chọn sai lầm. */