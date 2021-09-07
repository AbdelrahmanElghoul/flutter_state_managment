import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../const.dart';
import '../enum.dart';
import '../util.dart';
import 'api_constant.dart';

//request Factory
class Network {
  final String _tag = "Network";
  final timeoutDuration = Duration(seconds: kConnectionTimeOut);

  Future<dynamic> request(
    BuildContext context,
    String endpoint, {
    required RequestType requestType,
    Map<String, String>? headers,
    body,
  }) async {
    late Response res;
    final _header = headers ?? APIHeaders().defaultHeader;
    try {
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
      }

      DateTime postTime = DateTime.now();
      log(_tag,'$endpoint  code:${res.statusCode}  time:${postTime.difference(preTime).inMilliseconds} ms');

      final result = json.decode(res.data);
      if (result["success"] != null || (res.statusCode ?? 500) < 500) {
        return res;
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException catch (e) {
      log("$_tag netowrk error", '$endpoint $e');
      throw Exception("network connection error");

    } on TimeoutException catch (e) {
      log("$_tag error", '$endpoint $e');
      throw Exception("Connection time out.");

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> _post(endpoint, header, {body}) async {
    return await Dio().post(
      APIUrl.baseUrl + endpoint,
      options: Options(headers: header),
      data: body,
      onSendProgress: (int sent, int total) {
        log("sending from $endpoint", "$sent from $total");
      },
    ).timeout(timeoutDuration);
  }

  Future<Response> _delete(endpoint, header) async {
    return await Dio()
        .delete(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
        )
        .timeout(timeoutDuration);
  }

  Future<Response> _put(endpoint, header, {body}) async {
    return await Dio()
        .put(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
          data: body,
        )
        .timeout(timeoutDuration);
  }

  Future<Response> _get(endpoint, header) async {
    return await Dio()
        .get(
          APIUrl.baseUrl + endpoint,
          options: Options(headers: header),
        )
        .timeout(timeoutDuration);
  }

  /// https://stackoverflow.com/questions/57509972/flutter-dio-how-to-upload-image
  ///
// Future<String> uploadImage(File file) async {
//     String fileName = file.path.split('/').last;
//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(file.path, filename: fileName),
//     });
//     response = await dio.post("/info", data: formData);
//     return response.data['id'];
//   }
}
