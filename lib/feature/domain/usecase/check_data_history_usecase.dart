import 'package:dartz/dartz.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/core/usecase/usecase.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/repositories/repository.dart';

class GetLastLoadedUseCase implements UseCase<LoadedDataEntity, NoParams> {

  final Repository _repository;

  GetLastLoadedUseCase(this._repository);

  @override
  Future<Either<Failure, LoadedDataEntity>> call(NoParams params) async {
    return await _repository.getLastLoadedDate();
  }

}
