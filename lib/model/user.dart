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

  Future<void> updateUserData(Map<String,dynamic> user,Map<String,dynamic> data)async {
    this.user = user;
    data.forEach((key, val) {
      print('$key $val');
      this.user?.update(key, (value) => val);
    });
    // this.user.update(key, (value) => null);
    notifyListeners();
  }
}