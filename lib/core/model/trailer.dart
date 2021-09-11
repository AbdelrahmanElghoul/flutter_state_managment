
class Trailer {
  String? name;
  String? key;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Trailer({
    this. name,
    this.key,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  Trailer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['key'] = this.key;
    data['type'] = this.type;
    data['official'] = this.official;
    data['published_at'] = this.publishedAt;
    data['id'] = this.id;
    return data;
  }
}
