import 'package:flutter/cupertino.dart';
import 'package:flutter_example_app/core/error/exceptions.dart';
import 'package:flutter_example_app/core/utils/my_shared_pref.dart';
import 'package:flutter_example_app/feature/data/model/loaded_data_history_model.dart';

abstract class LocalDataSource {
  void saveLastLoadedState(String lastLoadedState);
  Future<LoadedDataModel> getLastLoadedState();
}

class LocalDataSourceImpl extends LocalDataSource {

  final MySharedPref mySharedPref;

  LocalDataSourceImpl({@required this.mySharedPref});

  @override
  Future<LoadedDataModel> getLastLoadedState() {
    final String time = mySharedPref.getLastLoadedState();
    if(time == null || time.isEmpty) {
      throw CacheException();
    }
    return Future.value(LoadedDataModel(loadedDateTime: time));
  }

  @override
  void saveLastLoadedState(String lastLoadedState) {
    mySharedPref.saveLastLoadedState(lastLoadedState);
  }

}