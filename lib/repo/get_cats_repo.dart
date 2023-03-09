import 'dart:io';

import 'package:dio/dio.dart';

import '../models/cats_model.dart';

class GetCatsRepo {
  final Dio dio;
  GetCatsRepo({required this.dio});

  Future<CatsModel> getCatsData() async {
    final response = await dio.get('https://aws.random.cat/meow');

    return CatsModel.fromJson(response.data);
  }
}
