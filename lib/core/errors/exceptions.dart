import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppException extends Equatable implements Exception {
  const AppException({
    required this.message,
    required this.statusCode,
  });

  final String? message;
  final int? statusCode;
}

class InternalException extends AppException {
  const InternalException({
    required super.message,
  }) : super(statusCode: 500);

  @override
  List<dynamic> get props => <dynamic>[
        message,
        statusCode,
      ];
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    required super.statusCode,
  });

  @override
  List<dynamic> get props => <dynamic>[
        message,
        statusCode,
      ];
}

class InvalidUserCredentialException extends AppException {
  const InvalidUserCredentialException({
    required super.message,
    required super.statusCode,
  });

  @override
  List<dynamic> get props => <dynamic>[
        message,
        statusCode,
      ];
}

Exception handleDataSourceException(
  Object? exception,
  String methodName,
) {
  debugPrint('##### DataSource Exception ($methodName): $exception #####');
  if (exception is ServerException) {
    throw ServerException(
      message: exception.message,
      statusCode: exception.statusCode,
    );
  } else {
    throw InternalException(
      message: exception.toString(),
    );
  }
}
