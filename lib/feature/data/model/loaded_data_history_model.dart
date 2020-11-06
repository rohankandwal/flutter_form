import 'package:equatable/equatable.dart';

class LoadedDataModel extends Equatable {
  final String loadedDateTime;

  LoadedDataModel({this.loadedDateTime});

  @override
  // TODO: implement props
  List<Object> get props => [loadedDateTime];

}