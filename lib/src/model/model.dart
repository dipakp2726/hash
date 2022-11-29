import 'package:flutter/cupertino.dart';

class AppState with ChangeNotifier {
//  iscommunityJOined
  bool _isCommnunityjoined = false;

  int _count = 12;

  bool get isCommnunityjoined => _isCommnunityjoined;
  int get count => _count;

  void joinCommunity() {
    _isCommnunityjoined = true;
    _count++;
    notifyListeners();
  }
}
