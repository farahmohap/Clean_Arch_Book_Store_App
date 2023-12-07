import 'package:dio/dio.dart';

abstract class Faliure {
  final String errMessage;

  Faliure(this.errMessage);
}

class ServerFailure extends Faliure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate Timeout With Api Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Cnnection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an error ,please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(response['error']['message']);
      } else if (statusCode == 404) {
        return ServerFailure('Your Request NotFound,Please,Try Again Later');
      } else if (statusCode == 500) {
        return ServerFailure('Internal server error');
      } else {
        return ServerFailure('Opps There Is An Error');
      }
    }
  }
}
