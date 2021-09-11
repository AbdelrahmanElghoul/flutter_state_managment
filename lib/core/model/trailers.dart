import 'package:multiple_state_managements/core/model/trailer.dart';

class Trailers {
  int? id;
  late List<Trailer> trailer;

  Trailers({this.id, List<Trailer>? trailer}) {
    this.id = id;
    this.trailer = trailer ?? [];
  }
  

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['trailer'] != null) {
      trailer = [];
      json['trailer'].forEach((v) {
        trailer.add(new Trailer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trailer'] = this.trailer.map((v) => v.toJson()).toList();

    return data;
  }
}
