import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:multiple_state_managements/core/base/base_exception.dart';
import '../const.dart';
import '../enum.dart';
import '../util.dart';
import 'api_constant.dart';

class Api {
  final String _tag = "Network";
  final Duration _timeoutDuration = Duration(seconds: kConnectionTimeOut);
  final _defaultErrorMessage = "Something went wrong.";

  Future<dynamic> requestAndValidate(
    String endpoint, {
    required RequestType requestType,
    Map<String, String>? header,
    body,
  }) async {
    try {
      final Response res = await _sendRequest(
        endpoint,
        requestType: requestType,
        header: header,
        body: body,
      );

      if (_isRequestValid(res)) return res;
    } on SocketException catch (e) {
      log("$_tag connection", '$endpoint $e');
      throw BaseException("network connection error");
    } on TimeoutException catch (e) {
      log("$_tag timeout", '$endpoint $e');
      throw BaseException("Connection time out.");
    } catch (e) {
      log("$_tag error", '$endpoint $e');
      throw BaseException(e.toString());
    }

    return null;
  }

  Future<Response> _sendRequest(
    String endpoint, {
    required RequestType requestType,
    Map<String, String>? header,
    body,
  }) async {
    late Response res;
    final _header = header ?? ApiHeaders().defaultHeader;

    DateTime preTime = DateTime.now();

    switch (requestType) {
      case RequestType.GET:
        res = await _get(endpoint, _header);
        break;
      case RequestType.PUT:
        res = await _put(endpoint, _header, body: body);
        break;
      case RequestType.DELETE:
        res = await _delete(endpoint, _header);
        break;
      case RequestType.POST:
        res = await _post(endpoint, _header, body: body);
        break;
      default:
        throw BaseException(this._defaultErrorMessage);
    }

    DateTime postTime = DateTime.now();
    log(_tag,
        '$endpoint  code:${res.statusCode}  time:${postTime.difference(preTime).inMilliseconds} ms');

    
    return res;
  }

  bool _isRequestValid(Response res) {
    _checkServerError(res.statusCode);
    _validateResponse(res);
    return res.data['success']!=null;
  }

  void _validateResponse(Response res) {
    final result = res.data;
    if (result['success'] == null) {
      throw BaseException(this._defaultErrorMessage,res.statusCode);
    } else if (!result['success'] || res.statusCode! > 200) {
      throw BaseException(result['message'] ?? this._defaultErrorMessage,res.statusCode);
    }
  }

  void _checkServerError(int? statusCode) {
    if ((statusCode ?? 500) >= 500)
      throw BaseException(this._defaultErrorMessage,500);
  }

  Future<Response> _post(endpoint, header, {body}) async {
    return await Dio().post(
      APIUrl.baseUrl + endpoint,
      options: Options(headers: header),
      data: body,
      onSendProgress: (int sent, int total) {
        log("sending from $endpoint", "$sent from $total");
      },
    ).timeout(_timeoutDuration);
  }

  Future<Response> _delete(endpoint, header) async {
    return await Dio()
        .delete(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
        )
        .timeout(_timeoutDuration);
  }

  Future<Response> _put(endpoint, header, {body}) async {
    return await Dio()
        .put(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
          data: body,
        )
        .timeout(_timeoutDuration);
  }

  Future<Response> _get(endpoint, header) async {
    return await Dio()
        .get(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
        )
        .timeout(_timeoutDuration);
  }

  /// https://stackoverflow.com/questions/57509972/flutter-dio-how-to-upload-image
// Future<String> uploadImage(File file) async {
//   String fileName = file.path.split('/').last;
//   FormData formData = FormData.fromMap({
//     "file": await MultipartFile.fromFile(file.path, filename: fileName),
//   });
//   response = await dio.post("/info", data: formData);
//   return response.data['id'];
// }
}
