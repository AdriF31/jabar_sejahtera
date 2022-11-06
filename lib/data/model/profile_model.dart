
class ProfileModel {
  bool? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UserDetail? userDetail;

  Data({this.id, this.name, this.email, this.emailVerifiedAt, this.role, this.createdAt, this.updatedAt, this.deletedAt, this.userDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    role = json["role"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    userDetail = json["user_detail"] == null ? null : UserDetail.fromJson(json["user_detail"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["role"] = role;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    if(userDetail != null) {
      _data["user_detail"] = userDetail?.toJson();
    }
    return _data;
  }
}

class UserDetail {
  int? id;
  String? phoneNumber;
  String? securityQuestion;
  String? image;
  String? createdAt;
  String? updatedAt;

  UserDetail({this.id, this.phoneNumber, this.securityQuestion, this.image, this.createdAt, this.updatedAt});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    phoneNumber = json["phone_number"];
    securityQuestion = json["security_question"];
    image = json["image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["phone_number"] = phoneNumber;
    _data["security_question"] = securityQuestion;
    _data["image"] = image;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}