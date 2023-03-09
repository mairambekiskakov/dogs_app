part of 'get_cats_bloc.dart';

@immutable
abstract class GetCatsState {}

class GetCatsInitial extends GetCatsState {}

class GetCatsSuccess extends GetCatsState {
  final CatsModel model;
  GetCatsSuccess({required this.model});
}

class GetCatsErorr extends GetCatsState {}
