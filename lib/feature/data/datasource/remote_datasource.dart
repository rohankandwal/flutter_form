import 'package:flutter/material.dart';
import 'package:flutter_example_app/feature/data/client/client.dart';

abstract class RemoteDataSource {
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClient client;

  RemoteDataSourceImpl({@required this.client});


}