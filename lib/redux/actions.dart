import 'package:redux/redux.dart';
import 'store_content.dart';

abstract class Action {
  StoreContent executeAction(StoreContent storeContent);
}

class LoginAction implements Action {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});

  @override
  StoreContent executeAction(StoreContent storeContent) {
    storeContent.users.forEach((element) {
      if (element.email == email && element.password == password) {
        storeContent.currentUser = element;
      }
    });
    return storeContent;
  }
}
