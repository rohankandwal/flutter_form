import 'package:equatable/equatable.dart';

class LoadedDataEntity extends Equatable {
  final String loadedDateTime;

  LoadedDataEntity({this.loadedDateTime});

  @override
  // TODO: implement props
  List<Object> get props => [loadedDateTime];

}