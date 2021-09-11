import 'package:multiple_state_managements/core/model/review.dart';

class Reviews {
  int? id;
  int? page;
  List<Review>? results;
  int? totalPages;
  int? totalResults;

  Reviews(
      {this.id, this.page, this.results, this.totalPages, this.totalResults});

  Reviews.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      results =[];
      json['results'].forEach((v) {
        results?.add(new Review.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

