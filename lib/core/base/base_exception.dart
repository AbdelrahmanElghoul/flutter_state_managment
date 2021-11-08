class BaseException implements Exception {
  final String? _message;
  final int? _statusCode;
  BaseException([this._message,this._statusCode]);

  @override
  String toString() {
    return "$_message";
  }

  int get getStatusCode=>_statusCode??-1;

}
