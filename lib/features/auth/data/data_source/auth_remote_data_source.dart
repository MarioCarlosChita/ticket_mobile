import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/enums/http_client_path_enum.dart';
import 'package:ticket_mobile/core/enums/cached_key_enum.dart';
import 'package:ticket_mobile/core/errors/exceptions.dart';
import 'package:ticket_mobile/core/network/app_http_client.dart';
import 'package:ticket_mobile/core/services/storage_service.dart';
import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/auth/data/model/sign_in_param_model.dart';
import 'package:ticket_mobile/features/auth/data/model/user_member_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserMemberModel> getUserMember();

  Future<bool> login({
    required SignInParamModel signInParam,
  });

  Future<bool> logout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required this.httpClient,
    required this.storageService,
  });

  final AppHttpClient httpClient;
  final StorageService storageService;

  @override
  Future<UserMemberModel> getUserMember() async {
    try {
      final Response response = await httpClient.get(
        path: HttpClientPath.getUserMember.pathName,
      );

      if (response.statusCode == HttpStatus.ok) {
        final DataMap responseData = response.data as DataMap;
        return UserMemberModel.fromJson(responseData);
      } else {
        throw ServerException(
          message: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } catch (exception) {
      throw handleDataSourceException(
        exception,
        'getUserMember',
      );
    }
  }

  @override
  Future<bool> login({
    required SignInParamModel signInParam,
  }) async {
    try {
      final Response response = await httpClient.post(
        path: HttpClientPath.login.pathName,
        data: signInParam.toMap(),
      );
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.noContent) {
        return true;
      } else {
        throw ServerException(
          message: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } catch (exception) {
      debugPrint(' --------- Exception --------- ');
      final DioException err = exception as DioException;
      debugPrint((err.response?.statusCode ?? 500).toString());
      debugPrint(' --------- Exception --------- ');
      int errorStatusCode = err.response?.statusCode ?? 500;
      if (errorStatusCode == HttpStatus.unauthorized ||
          errorStatusCode == HttpStatus.badRequest) {
        throw InvalidUserCredentialException(
          message: err.message,
          statusCode: errorStatusCode,
        );
      } else {
        throw handleDataSourceException(
          exception,
          'login',
        );
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      /// Remove the cookie value
      await storageService.deleteKey(
        CachedKey.cookie.key,
      );
      return true;
    } catch (exception) {
      throw handleDataSourceException(
        exception,
        'logout',
      );
    }
  }
}
