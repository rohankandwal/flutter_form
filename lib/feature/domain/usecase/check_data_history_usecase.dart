import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/core/usecase/usecase.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/repositories/repository.dart';

class GetLastLoadedUseCase implements UseCase<LoadedDataEntity, LoadedParam> {

  final Repository _repository;

  GetLastLoadedUseCase(this._repository);

  @override
  Future<Either<Failure, LoadedDataEntity>> call(LoadedParam params) async {
    return await _repository.getLastLoadedDate();
  }

}

class LoadedParam extends Equatable{
  String username;
  String password;

  LoadedParam({this.username, this.password});

  @override
  List<Object> get props => [username, password];
}
