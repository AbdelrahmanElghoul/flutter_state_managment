abstract class APIUrl {
  static String _domain = 'https://api.themoviedb.org/3/movie/';
  static String imgPath = "https://image.tmdb.org/t/p/w500/";
  static String get baseUrl => "";
}

class ApiHeaders {
  //
  final Map<String, dynamic> defaultHeader = {
    'Accept': "application/json",
    'Content-Type': "application/json"
  };

// Map<String, String> userHeader = {
//   'Authorization':
//       "bearer ${SPreference.getString(PreferenceKey.USER_TOKEN)}",
//   'Accept': "application/json",
//   'Content-Type': "application/json"
// };
}
