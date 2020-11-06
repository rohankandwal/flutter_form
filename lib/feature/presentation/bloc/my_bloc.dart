import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example_app/core/usecase/usecase.dart';
import 'package:flutter_example_app/feature/data/model/loaded_data_history_model.dart';
import 'package:flutter_example_app/feature/domain/entities/loaded_data_history_entity.dart';
import 'package:flutter_example_app/feature/domain/usecase/check_data_history_usecase.dart';
import 'package:meta/meta.dart';

part 'my_event.dart';

part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  final GetLastLoadedUseCase getLastLoadedUseCase;

  MyBloc({@required GetLastLoadedUseCase getLastLoadedUseCase})
      : assert(getLastLoadedUseCase != null),
        getLastLoadedUseCase = getLastLoadedUseCase,
        super(Empty());

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    if (event is DidWeLoadData) {
      yield Loading();
      final useCase = await getLastLoadedUseCase(NoParams());
      yield* useCase.fold(
          (failure) async* {
            yield Error(message: "No cache found");
          },
          (loadedDataEntity) async* {
            yield Loaded(
                dataModel: loadedDataEntity);
          });
    }
  }
}
