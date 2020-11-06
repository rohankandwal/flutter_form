import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_app/core/error/exceptions.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/core/network/network_info.dart';
import 'package:flutter_example_app/feature/data/datasource/local_datasource.dart';
import 'package:flutter_example_app/feature/data/datasource/remote_datasource.dart';
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
        return Right(LoadedDataEntity(loadedDateTime: loadedDataModel.loadedDateTime));
      } on CacheException {
        return Left(CacheFailure());
      }
    // } else {
    //   return Left(ServerFailure());
    // }
  }

}