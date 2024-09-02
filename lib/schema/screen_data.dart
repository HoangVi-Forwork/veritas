// ignore_for_file: constant_identifier_names

enum ScreenState {
  IDEAL,
  LOADING,
  SUCCESS,
  ERROR,
  LOADMORE,
  REFRESH,
  EMPTY,
}

class ScreenData<T> {
  T? data;
  String? message;
  List<String>? messages;
  ScreenState screenState;

  ScreenData({
    this.data,
    this.message,
    this.messages,
    this.screenState = ScreenState.IDEAL,
  });
}
