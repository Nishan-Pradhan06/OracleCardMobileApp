import 'dart:async';
import 'package:dio/dio.dart';

import '../../common/logger.dart';

class AppDioInterceptor extends Interceptor {
  Completer<String?>? _refreshTokenCompleter;

  final Set<String> _publicRoutes = <String>{
    '/api/Auth/Login',
    '/api/Office/GetItem',
    '/api/Auth/RefreshToken',
    '/api/Auth/ForgotPassword',
    '/api/Auth/ActivateLoginByOtp',
    '/api/Auth/GetNewOtp',
    '/api/UserList/Insert',
  };

  final String _logoutRoute = '/api/MyProfile/Logout';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _attachTokenToRequest(options, handler);
  }

  Future<void> _attachTokenToRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String path = options.uri.path;
    if (_publicRoutes.contains(path)) {
      dLog.d("[Request] Path '/$path' is public, skipping token.");
      return handler.next(options);
    }

    try {
      // final String? token = await CacheService.instance.getAuthToken();
      // if (token != null) {
      //   options.headers['Authorization'] = 'Bearer $token';
      //   dLog.i("[Request] Token attached for '/$path'.");
      // } else {
      //   dLog.w(
      //     "[Request] No auth token found for protected route '/${options.path}'.",
      //   );
      // }
    } catch (e) {
      dLog.e('[Request] Error attaching token: $e');
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final String path = err.requestOptions.uri.path;
    dLog.d(
      "[Error] Interceptor caught an error for '/$path': ${err.response?.statusCode}",
    );

    if (err.response?.statusCode != 401 ||
        _publicRoutes.contains(path) ||
        _logoutRoute == path) {
      return handler.next(err);
    }

    // Log the 401 detection
    dLog.w(" unauthorized for '/$path'. Initiating token refresh logic.");

    // final String? refreshToken = await CacheService.instance.getRefreshToken();
    // if (refreshToken == null || refreshToken.isEmpty) {
    //   dLog.e('[Auth] No refresh token found. Logging out.');
    //   // normalLogoutFromSessionExpiration();
    //   return handler.reject(err);
    // }

    // if (_refreshTokenCompleter == null) {
    //   dLog.i('[Auth] No refresh in progress. Starting new token refresh.');
    //   _refreshTokenCompleter = Completer<String?>();
    //   _refreshToken()
    //       .then((String? newToken) {
    //         _refreshTokenCompleter!.complete(newToken);
    //       })
    //       .catchError((error) {
    //         _refreshTokenCompleter!.completeError(error);
    //       })
    //       .whenComplete(() {
    //         dLog.i(
    //           '[Auth] Refresh operation finished. Unlocking for future requests.',
    //         );
    //         _refreshTokenCompleter = null; // Unlock
    //       });
    // } else {
    //   dLog.i(
    //     '[Auth] Token refresh already in progress. Waiting for completion...',
    //   );
    // }

    try {
      final String? newToken = await _refreshTokenCompleter!.future;

      // if (newToken == null) {
      //   dLog.e('[Auth] Token refresh failed. Logging out user.');
      //   DebugUtils.showDebugToast('Token refresh failed. Logging out user.');
      //   normalLogoutFromSessionExpiration();
      //   return handler.reject(_createSessionExpiredError(err.requestOptions));
      // }

      dLog.i(
        "[Retry] Token refreshed successfully. Retrying original request to '/$path'.",
      );

      // final Response response = await _retryRequest(
      //   err.requestOptions,
      //   // newToken,
      // );
      // return handler.resolve(response);
    } catch (e) {
      dLog.e('[Retry] Error while awaiting token or retrying request: $e');
      return handler.reject(e is DioException ? e : err);
    }
  }

  // Future<String?> _refreshToken() async {
  //   dLog.i('[Refresh] Attempting to get a new access token...');
  //   final Dio dio = Dio();
  //   const RetryOptions retry = RetryOptions(maxAttempts: 3);

  //   try {
  //     final String? refreshToken = await CacheService.instance
  //         .getRefreshToken();
  //     if (refreshToken == null) {
  //       dLog.w('[Refresh] Cannot refresh, token is null in storage.');
  //       return null;
  //     }

  //     final Response response = await retry.retry(
  //       () => dio.post(
  //         '${EnvConfig.instance.apiBaseUrl}Auth/RefreshToken',
  //         data: <String, String>{'RefreshToken': refreshToken},
  //       ),
  //       retryIf: (Exception exception) =>
  //           exception is DioException && _shouldRetry(exception),
  //     );

  //     await saveToken(response.data);
  //     dLog.i('[Refresh] Successfully refreshed and saved new tokens.');
  //     return response.data['AccessToken'];
  //   } catch (e) {
  //     dLog.e('[Refresh] CRITICAL: Exception during token refresh: $e');
  //     if (e is DioException) {
  //       dLog.e('[Refresh] CRITICAL:****: ${e.response?.data}');
  //     }
  //     DebugUtils.showDebugToast(
  //       'Refresh request failed with status: ${e.toString()}',
  //     );
  //     return null;
  //   }
  // }

  Future<Response> _retryRequest(
    RequestOptions requestOptions,
    String newToken,
  ) {
    final Dio dio = Dio();
    requestOptions.headers['Authorization'] = 'Bearer $newToken';
    dLog.d(
      "[Retry] Attaching new token and re-fetching '${requestOptions.path}'",
    );
    return dio.fetch(requestOptions);
  }

  DioException _createSessionExpiredError(RequestOptions requestOptions) {
    // ... (rest of the function is the same)
    return DioException(
      requestOptions: requestOptions,
      error: 'Session expired. Please login again.',
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: requestOptions,
        statusCode: 401,
        data: <String, String>{'message': 'Session expired'},
      ),
    );
  }
}

bool _shouldRetry(DioException error) {
  return error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.receiveTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.response?.statusCode == 500 ||
      error.response?.statusCode == 503 ||
      error.response?.statusCode == 502;
}
