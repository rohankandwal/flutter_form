import 'package:dio/dio.dart';
import 'package:flutter_example_app/core/utils/my_shared_pref.dart';
import 'package:flutter_example_app/feature/data/model/github_feed_model.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
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

  @GET("/feeds")
  Future<GitHubFeedModel> getFeeds();
}
