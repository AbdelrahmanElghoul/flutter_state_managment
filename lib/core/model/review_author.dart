
class AuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  int? rating;

  AuthorDetails({this.name, this.username, this.avatarPath, this.rating});

  AuthorDetails.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['avatar_path'] = this.avatarPath;
    data['rating'] = this.rating;
    return data;
  }
}
