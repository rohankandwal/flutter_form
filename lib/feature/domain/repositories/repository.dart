import 'package:dartz/dartz.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/feature/domain/entities/github_feed_entity.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';

abstract class Repository {

  /// getting last loaded state
  Future<Either<Failure, LoadedDataEntity>> getLastLoadedDate();

  Future<Either<Failure, GithubFeedEntity>> getGitHubFeed();
}