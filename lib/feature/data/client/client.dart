import 'package:dio/dio.dart';
import 'package:flutter_example_app/core/utils/my_shared_pref.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi(baseUrl: "http://15.207.17.172:8080/")
abstract class RestClient {

  factory RestClient(final Dio dio, final MySharedPref sharedPref) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) {
      /*if (sharedPref.getAuthToken() != null &&
          sharedPref.getAuthToken().isNotEmpty) {
        option.headers[Constants.AUTHORIZATION] =
        "Bearer " + sharedPref.getAuthToken();

      }
  */
      return option;
    }));
    return _RestClient(dio);
  }
}
