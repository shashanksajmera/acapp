import 'package:flutter/cupertino.dart';

class CurrentUserData with ChangeNotifier{
  Map<String,dynamic>? user;

  Map<String,dynamic>? get currentUser{
    return user;
  }
  void setCurrentUser(Map<String,dynamic> user){
    this.user = user;
    notifyListeners();
  }
}