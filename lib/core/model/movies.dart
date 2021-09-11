import 'movie.dart';

class Movies {
  int? page;
  int? totalPages;
  int? totalResults;
  List<Movie>? movies;

  Movies({
    this.page,
    this.totalPages,
    this.totalResults,
    this.movies,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalResults = json['total_pages'];
    this.totalResults = json['total_results'];

    if (json['results'] != null) {
      this.movies = [];
      json['results'].forEach((v) {
        this.movies?.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    data['results'] = this.movies?.map((v) => v.toJson()).toList();

    return data;
  }
}
