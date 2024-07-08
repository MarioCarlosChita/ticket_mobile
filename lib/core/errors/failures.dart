import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String? message;
  final int? statusCode;

  @override
  List<dynamic> get props => <dynamic>[
        message,
        statusCode,
      ];
}

class InternalFailure extends Failure {
  const InternalFailure({
    required super.message,
    required super.statusCode,
  });

  InternalFailure.fromException(
    InternalException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );

  @override
  String toString() {
    return '$statusCode Error: $message';
  }
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.statusCode,
  });

  ServerFailure.fromException(
    ServerException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
  @override
  String toString() {
    return '$statusCode Error: $message';
  }
}

class InvalidUserCredentialFailure extends Failure {
  const InvalidUserCredentialFailure({
    required super.message,
    required super.statusCode,
  });

  InvalidUserCredentialFailure.fromException(
    InvalidUserCredentialException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
  @override
  String toString() {
    return '$statusCode Error: $message';
  }
}

/// Converts an [Exception] from DataSource into a [Failure] for Repository
Left<Failure, T> handleRepositoryException<T>(
  Exception exception,
  String methodName,
) {
  debugPrint('###### Repository Exception ($methodName): $exception ######');
  if (exception is ServerException) {
    return Left<Failure, T>(
      ServerFailure.fromException(exception),
    );
  }
  if (exception is InvalidUserCredentialException) {
    return Left<Failure, T>(
      InvalidUserCredentialFailure.fromException(exception),
    );
  }
  return Left<Failure, T>(
    InternalFailure.fromException(exception as InternalException),
  );
}
