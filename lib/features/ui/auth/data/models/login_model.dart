class LoginResModel {
  String? _accessToken;
  String? _refreshToken;
  bool? _status;
  User? _user;

  LoginResModel({
    String? accessToken,
    String? refreshToken,
    bool? status,
    User? user,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _status = status;
    _user = user;
  }

  String? get accessToken => _accessToken;
  set accessToken(String? value) => _accessToken = value;

  String? get refreshToken => _refreshToken;
  set refreshToken(String? value) => _refreshToken = value;

  bool? get status => _status;
  set status(bool? value) => _status = value;

  User? get user => _user;
  set user(User? value) => _user = value;

  LoginResModel.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
    _status = json['status'];
    _user = json['user'] != null
        ? User.fromJson(json['user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['access_token'] = _accessToken;
    data['refresh_token'] = _refreshToken;
    data['status'] = _status;

    if (_user != null) {
      data['user'] = _user!.toJson();
    }

    return data;
  }
}

class User {
  String? _email;
  List<dynamic>? _favoriteProducts;
  int? _id;
  dynamic _imagePath;
  String? _name;
  String? _phone;

  User({
    String? email,
    List<dynamic>? favoriteProducts,
    int? id,
    dynamic imagePath,
    String? name,
    String? phone,
  }) {
    _email = email;
    _favoriteProducts = favoriteProducts;
    _id = id;
    _imagePath = imagePath;
    _name = name;
    _phone = phone;
  }

  String? get email => _email;
  set email(String? value) => _email = value;

  List<dynamic>? get favoriteProducts => _favoriteProducts;
  set favoriteProducts(List<dynamic>? value) =>
      _favoriteProducts = value;

  int? get id => _id;
  set id(int? value) => _id = value;

  dynamic get imagePath => _imagePath;
  set imagePath(dynamic value) => _imagePath = value;

  String? get name => _name;
  set name(String? value) => _name = value;

  String? get phone => _phone;
  set phone(String? value) => _phone = value;

  User.fromJson(Map<String, dynamic> json) {
    _email = json['email'];

    if (json['favorite_products'] != null) {
      _favoriteProducts =
      List<dynamic>.from(json['favorite_products']);
    }

    _id = json['id'];
    _imagePath = json['image_path'];
    _name = json['name'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = _email;
    data['favorite_products'] = _favoriteProducts;
    data['id'] = _id;
    data['image_path'] = _imagePath;
    data['name'] = _name;
    data['phone'] = _phone;

    return data;
  }
}