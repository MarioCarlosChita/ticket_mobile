import 'package:dio/dio.dart';
import 'package:ticket_mobile/core/helpers/flavour_helper.dart';
import 'package:ticket_mobile/core/network/app_http_interceptor.dart';
import 'package:ticket_mobile/core/services/storage_service.dart';

abstract class AppHttpClient {
  Future<Response<dynamic>> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response<dynamic>> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}

class AppHttpClientImpl implements AppHttpClient {
  AppHttpClientImpl({
    required this.dio,
    required this.storageService,
  }) {
    // Add interceptor wrapper in dio http client.
    dio
      ..options.baseUrl = Flavour.getBaseUrl()
      ..interceptors.add(
        AppHttpInterceptor(
          storageService: storageService,
        ),
      );
  }
  final Dio dio;
  final StorageService storageService;

  @override
  Future<Response<dynamic>> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<dynamic>> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
