import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_app/core/error/exceptions.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/core/network/network_info.dart';
import 'package:flutter_example_app/feature/data/datasource/local_datasource.dart';
import 'package:flutter_example_app/feature/data/datasource/remote_datasource.dart';
import 'package:flutter_example_app/feature/domain/entities/github_feed_entity.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {@required this.networkInfo,
      @required this.localDataSource,
      @required this.remoteDataSource});

  @override
  Future<Either<Failure, LoadedDataEntity>> getLastLoadedDate() async {
    // if (await networkInfo.isConnected) {
    try {
      final loadedDataModel = await localDataSource.getLastLoadedState();
      return Right(
          LoadedDataEntity(loadedDateTime: loadedDataModel.loadedDateTime));
    } on CacheException {
      return Left(CacheFailure());
    }
    // } else {
    //   return Left(ServerFailure());
    // }
  }

  @override
  Future<Either<Failure, GithubFeedEntity>> getGitHubFeed() async {
    if (await networkInfo.isConnected) {
      try {
        /// Remember to add internet permission to Android Manifest
        final feeds = await remoteDataSource.getGitHubFeed();
        // Updating the cache
        localDataSource.saveLastLoadedState("Got last data on " + DateTime.now().toString());
        return Right(GithubFeedEntity(securityAdvisoryUrl: feeds.security_advisories_url, timeLineUrl: feeds.timeline_url, userUrl: feeds.user_url));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
