part of 'my_bloc.dart';

@immutable
abstract class MyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DidWeLoadData extends MyEvent {

}
