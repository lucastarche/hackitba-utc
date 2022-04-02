class StoreContent {
  List<User> users;
  User? currentUser;

  StoreContent({required this.users, this.currentUser});
}

class User {
  String email;
  String password;

  User({required this.email, required this.password});
}
