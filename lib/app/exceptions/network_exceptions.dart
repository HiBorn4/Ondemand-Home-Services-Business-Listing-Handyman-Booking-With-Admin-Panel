import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as _get;

import '../routes/app_routes.dart';

abstract class NetworkExceptions {
  static String handleResponse(Response<dynamic>? response) {
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        _get.Get.offAllNamed(Routes.LOGIN);
        return "Unauthorized Request";
      case 404:
        return "Not found";
      case 409:
        return "Error due to a conflict";
      case 408:
        return "Connection request timeout";
      case 500:
        return "Internal Server Error";
      case 503:
        return "Service unavailable";
      default:
        return "Received an invalid status code";
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorMessage = "Request Cancelled";
              break;
            case DioErrorType.connectTimeout:
              errorMessage = "Connection request timeout";
              break;
            case DioErrorType.other:
              errorMessage = "No internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioErrorType.response:
              errorMessage = NetworkExceptions.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              errorMessage = "Send timeout in connection with the API server";
              break;
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection";
        } else {
          errorMessage = "Unexpected error occurred";
        }
        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data";
      } else {
        return "Unexpected error occurred";
      }
    }
  }
}
