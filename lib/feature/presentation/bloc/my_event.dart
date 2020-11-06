part of 'my_bloc.dart';

@immutable
abstract class MyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DidWeLoadData extends MyEvent {
  String username;
  String password;

  DidWeLoadData({this.username, this.password});
}

class LoadGitHubFeed extends MyEvent {

}
