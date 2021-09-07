

abstract class APIUrl {
  //TODO change domain onRelease
  static String domain = 'domain';
  static String imgPath = domain;
  static String get baseUrl =>
      "$domain";
}

class APIHeaders {
  //
  final Map<String, String> defaultHeader = {
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
