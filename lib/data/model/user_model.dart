
// ignore_for_file: no_leading_underscores_for_local_identifiers

class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? image;
  String? role;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Tokens>? tokens;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.image, this.role, this.createdAt, this.updatedAt, this.deletedAt, this.tokens});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    image = json["image"];
    role = json["role"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    tokens = json["tokens"] == null ? null : (json["tokens"] as List).map((e) => Tokens.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["image"] = image;
    _data["role"] = role;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    if(tokens != null) {
      _data["tokens"] = tokens?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Tokens {
  String? id;
  int? userId;
  int? clientId;
  String? name;
  List<dynamic>? scopes;
  bool? revoked;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;

  Tokens({this.id, this.userId, this.clientId, this.name, this.scopes, this.revoked, this.createdAt, this.updatedAt, this.expiresAt});

  Tokens.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    clientId = json["client_id"];
    name = json["name"];
    scopes = json["scopes"] ?? [];
    revoked = json["revoked"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    expiresAt = json["expires_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["client_id"] = clientId;
    _data["name"] = name;
    if(scopes != null) {
      _data["scopes"] = scopes;
    }
    _data["revoked"] = revoked;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["expires_at"] = expiresAt;
    return _data;
  }
}