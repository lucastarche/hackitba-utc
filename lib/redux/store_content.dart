class StoreContent {
  List<User> users;
  List<WebPageElement> webPages;
  User? currentUser;

  StoreContent({required this.users, required this.webPages, this.currentUser});
}

class WebPageElement {
  final String url;
  final String title;

  WebPageElement({required this.url, required this.title});
}

class User {
  String email;
  String password;
  bool isAdmin;

  User({required this.email, required this.password, required this.isAdmin});
}
