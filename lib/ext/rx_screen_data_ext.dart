import 'package:get/get.dart';
import 'package:veritas/schema/screen_data.dart';

extension RxScreenDataExt<T> on Rx<ScreenData<T>> {
  void showLoading() {
    value.screenState = ScreenState.LOADING;
    refresh();
  }

  void showData(T data) {
    value.data = data;
    value.screenState = ScreenState.SUCCESS;
    refresh();
  }

  void showError({
    String? massage,
    List<String>? massages,
  }) {
    value.message = massage;
    value.messages = massages;
    value.screenState = ScreenState.ERROR;
    refresh();
  }
}
