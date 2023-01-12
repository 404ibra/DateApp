/* 
{
    "name": "",
    "gender": "",
    "profile_image_url": "",
    "email": "",
    "is_profile_visible": true
}
*/

class UserModel {
  String? name;
  String? gender;
  String? profileImageUrl;
  String? email;
  bool? isProfileVisible;

  UserModel(
      {this.name,
      this.gender,
      this.profileImageUrl,
      this.email,
      this.isProfileVisible});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    profileImageUrl = json['profile_image_url'];
    email = json['email'];
    isProfileVisible = json['is_profile_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['profile_image_url'] = this.profileImageUrl;
    data['email'] = this.email;
    data['is_profile_visible'] = this.isProfileVisible;
    return data;
  }
}
