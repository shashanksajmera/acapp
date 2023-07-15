import 'package:flutter/cupertino.dart';

class CurrentUserData with ChangeNotifier{
  Map<String,dynamic>? user;

  Map<String,dynamic>? get currentUser{
    return user;
  }

  String get role => user?['role'];


  void setCurrentUser(Map<String,dynamic> user){
    this.user = user;
    notifyListeners();
  }

  void updateUserData(Map<String,dynamic> user,String? fieldname,dynamic val){
    this.user = user;
    this.user?[fieldname!] = val;
    notifyListeners();
  }
}