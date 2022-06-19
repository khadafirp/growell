import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:growell/base/module/base_modul.dart';
import 'package:growell/base/network/network_client.dart';
import 'package:growell/base/network/result_response.dart';
import 'package:logger/logger.dart';


class BaseService {
  final content = 'content';
  static const getMethod = 'GET';
  static const postMethod = 'POST';
  static const putMethod = 'PUT';
  static const patchMethod = 'PATCH';
  static const deleteMethod = 'DELETE';

  Future<ResultResponse> callService({
    required String url,
    required String baseUrl,
    String method = getMethod,
    var dataBody,
    Map<String, Object>? queryParam,
    Map<String, Object>? headers,
    bool requireToken = true,
  }) async {
    Logger log = Logger();

    try {
      final client = injector<NetworkClient>().getClient();
      client.options.method = method;
      client.options.baseUrl = baseUrl;
      client.options.headers = headers;
      client.options.sendTimeout = 30000;
      client.options.connectTimeout = 30000;
      client.options.receiveTimeout = 30000;

      if (headers != null) {
        client.options.headers.addAll({
          ...headers,
        });
      }

      // if (requireToken) {
      //   client.options.headers.addAll(
      //     {
      //       'X-Auth-Token': await _preference.getStringValue(PrefKey.token),
      //     });
      // }
      final Response response = await client.request(url = url,
          data: dataBody, queryParameters: queryParam);
      log.v(
          'RESPONSE \n\nEndpoint: $url \nStatusCode: ${response.statusCode} \nStatusMessage: ${response.statusMessage} \nData: ${response.data}');

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Success(response.data);
      } else {
        return Error(ErrorData(response.data['message'], response.statusCode!));
      }
    } on PlatformException catch (e) {
      return Error(ErrorData(e.message!, 500));
    } on DioError catch (e) {
      log.v(
          'ERROR \n\nEndpoint: $url \nMessage: ${e.message} \nStatusCode: ${e.response?.statusCode} \nStatusMessage: ${e.response?.statusMessage} \nData: ${e.response?.data}');
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        return Error(ErrorData('Connection Timeout', e.response!.statusCode!));
      } else if (e.response != null && e.response!.statusCode == 404) {
        return Error(ErrorData('not found', e.response!.statusCode!));
      } else if (e.response != null && e.response!.statusCode == 401 ||
          e.response != null && e.response!.statusCode == 403) {
        // for Autologout Implementation
        // _preference.setValue(PrefKey.userId, '');
        // _preference.setValue(PrefKey.userName, '');
        // _preference.setValue(PrefKey.email, '');
        // _preference.setValue(PrefKey.hpl, 0);
        // Routes.sailor.navigate(Routes.pageLogin,
        //     removeUntilPredicate: (Route<dynamic> route) => false,
        //     navigationType: NavigationType.pushAndRemoveUntil,
        //     params: {/*LoginPage.isChangeNumberPageParam: false*/});
        return Error(ErrorData('logged out', e.response!.statusCode!));
      } else if (e.response != null && e.response!.statusCode == 405 ||
          e.response != null && e.response!.statusCode == 503 ||
          e.response != null && e.response!.statusCode == 504 ||
          e.response != null && e.response!.statusCode == 500) {
        return Error(ErrorData('general error', 500));
      } else {
        return Error(ErrorData(
            e.response?.data['message'] ?? '', e.response?.statusCode ?? 0));
      }
    }
  }
}
