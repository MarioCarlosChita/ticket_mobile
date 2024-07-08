import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ticket_mobile/core/enums/cached_key_enum.dart';
import 'package:ticket_mobile/core/enums/http_client_path_enum.dart';
import 'package:ticket_mobile/core/services/storage_service.dart';

class AppHttpInterceptor implements InterceptorsWrapper {
  AppHttpInterceptor({
    required this.storageService,
  });

  final StorageService storageService;

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    return handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path != HttpClientPath.login.pathName) {
      final String? cookie = await storageService.readKey(
        CachedKey.cookie.key,
      );
      debugPrint("------- cookiesData ----- ");
      debugPrint(cookie);
      debugPrint("------- cookiesData ----- ");
      final List<dynamic> cookiesData =
          jsonDecode(cookie ?? '') as List<dynamic>;
      options.headers['Cookie'] = cookiesData.first;
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.requestOptions.path == HttpClientPath.login.pathName) {
      storageService.write(
        key: CachedKey.cookie.key,
        value: jsonEncode(response.headers['set-cookie'] ?? []),
      );
    }
    return handler.next(response);
  }
}
