import 'package:multiple_state_managements/core/model/genres.dart';
import 'package:multiple_state_managements/core/model/spoken_language.dart';

class Movie {
  bool? adult;
  String? backdropPath;
  List<Genres>? genres;
  int? id;
  String? imdbId; // https://www.imdb.com/title/$imdbId/
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  double? voteAverage;
  List<SpokenLanguages>? spokenLanguages;
  String? title;

  Movie({
    this.adult,
    this.backdropPath,
    this.id,
    this.genres,
    this.voteAverage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.spokenLanguages,
    this.title,
  });

  Movie.fromJson(Map<String?, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(new Genres.fromJson(v));
      });
    }
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(new SpokenLanguages.fromJson(v));
      });
    }

    title = json['title'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_average']=this.voteAverage;
    if (this.genres != null) {
      data['genres'] = this.genres?.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['runtime'] = this.runtime;
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages?.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;

    return data;
  }
}
