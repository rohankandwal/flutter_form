import 'package:dartz/dartz.dart';
import 'package:flutter_example_app/core/error/failures.dart';
import 'package:flutter_example_app/core/usecase/usecase.dart';
import 'package:flutter_example_app/feature/domain/entities/github_feed_entity.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/repositories/repository.dart';

class GetGitHubFeedUseCase implements UseCase<GithubFeedEntity, NoParams> {

  final Repository _repository;

  GetGitHubFeedUseCase(this._repository);

  @override
  Future<Either<Failure, GithubFeedEntity>> call(NoParams params) async {
    return await _repository.getGitHubFeed();
  }

}
