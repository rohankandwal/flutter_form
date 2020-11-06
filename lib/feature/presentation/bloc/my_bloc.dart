import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example_app/core/usecase/usecase.dart';
import 'package:flutter_example_app/feature/data/model/loaded_data_history_model.dart';
import 'package:flutter_example_app/feature/domain/entities/github_feed_entity.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/usecase/check_data_history_usecase.dart';
import 'package:flutter_example_app/feature/domain/usecase/get_github_feed_usecase.dart';
import 'package:meta/meta.dart';

part 'my_event.dart';

part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  final GetLastLoadedUseCase getLastLoadedUseCase;
  final GetGitHubFeedUseCase getGitHubFeedUseCase;

  MyBloc({@required GetLastLoadedUseCase getLastLoadedUseCase, @required GetGitHubFeedUseCase getGitHubFeedUseCase})
      : assert(getLastLoadedUseCase != null),
        assert(getGitHubFeedUseCase != null),
        getLastLoadedUseCase = getLastLoadedUseCase,
        getGitHubFeedUseCase = getGitHubFeedUseCase,
        super(Empty());

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    if (event is DidWeLoadData) {
      yield Loading();
      final useCase = await getLastLoadedUseCase.call(LoadedParam(username: event.username, password: event.password));
      yield* useCase.fold(
          (failure) async* {
            yield Error(message: "No cache found");
          },
          (loadedDataEntity) async* {
            yield Loaded(
                dataModel: loadedDataEntity);
          });
    } else if(event is LoadGitHubFeed) {
      yield Loading();
      final useCase = await getGitHubFeedUseCase(NoParams());
      yield* useCase.fold(
              (failure) async* {
            yield Error(message: "Some error occurred");
          },
              (feedEntity) async* {
            yield Loaded(
                feedEntity: feedEntity);
          });
    }
  }
}
