import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  // Factory constructor to create a ServerFailure from a DioException
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage:
                "Connection timed out With ApiService. Please try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage:
                "Request took too long to send. Please check your connection.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage:
                "Response timed out. The server might be taking too long.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage:
                "Invalid certificate. Cannot establish a secure connection.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.data, dioException.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: "Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage:
                "Connection error. Please check your internet connection.");
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
            errorMessage: "Something went wrong. Please try again.");
    }
  }
  factory ServerFailure.fromResponse(dynamic response, int statusCode) {
    if (statusCode == 401) {
      return ServerFailure(
          errorMessage:
              "${response['error']['message']}\n Unauthorized. Please check your credentials.");
    } else if (statusCode == 403) {
      return ServerFailure(
          errorMessage:
              "${response['error']['message']}\n Access denied. You do not have permission to access this resource.");
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage:
              "Resource not found. The requested  could not be found.");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: " Internal server error. Please try again later.");
    } else {
      return ServerFailure(
          errorMessage:
              " Unexpected error occurred with status code: $statusCode.");
    }
  }
  // // Helper function to handle bad response errors and give specific feedback
  // static String _handleBadResponse(DioException dioException) {
  //   final statusCode = dioException.response?.statusCode;
  //   if (statusCode != null) {
  //     switch (statusCode) {
  //       case 400:
  //         return "Bad request. Please verify your input.";
  //       case 401:
  //         return "Unauthorized. Please check your credentials.";
  //       case 403:
  //         return "Access denied. You do not have permission to access this resource.";
  //       case 404:
  //         return "Resource not found. The requested data could not be found.";
  //       case 500:
  //         return "Internal server error. Please try again later.";
  //       default:
  //         return "Unexpected error occurred with status code: $statusCode.";
  //     }
  //   }
  //   return "Unexpected server response.";
  // }
}
