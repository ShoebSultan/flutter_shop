import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
