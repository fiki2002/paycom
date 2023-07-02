import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:paycom/cores/utils/logger.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  /// Make an [Http] post request
  static Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      LoggerHelper.log(url);

      http.Response response = await http
          .post(
            Uri.parse(url),
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 30));

      LoggerHelper.log(response.body);

      final Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw checkForError(result);
      }
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);
      if (kDebugMode) {
        throw 'Unable To Format Data!';
      }

      throw 'Something went wrong, please try again';
    } on TimeoutException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Request Timeout, Unable to connect to server please check your network and try again!';
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);
      throw 'Unable to connect to server please check your network and try again!';
    } catch (e) {
      throw e.toString();
    }
  }

    static String checkForError(Map data) {
    if (data['status'] == 400 ) {
      final String? message = data['message'];

      if (message != null) {
        throw message;
      }

      final Map<String, dynamic> errorMap = Map.from(data['error']);

      return errorMap.values.join('\n');
    }

    return 'Something went wrong, Please try again';
  }
}
