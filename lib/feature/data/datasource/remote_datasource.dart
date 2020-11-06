import 'package:flutter/material.dart';
import 'package:flutter_example_app/core/error/exceptions.dart';
import 'package:flutter_example_app/feature/data/client/client.dart';
import 'package:flutter_example_app/feature/data/model/github_feed_model.dart';

abstract class RemoteDataSource {
  Future<GitHubFeedModel> getGitHubFeed();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClient client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<GitHubFeedModel> getGitHubFeed() {
    try {
      return client.getFeeds();
    } catch (exception) {
      throw ServerException(exception.toString());
    }
  }


}