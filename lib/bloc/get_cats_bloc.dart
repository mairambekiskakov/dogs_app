import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/cats_model.dart';
import '../repo/get_cats_repo.dart';
part 'get_cats_event.dart';
part 'get_cats_state.dart';

class GetCatsBloc extends Bloc<GetCatsEvent, GetCatsState> {
  GetCatsBloc({required this.repo}) : super(GetCatsInitial()) {
    on<GetCatsDataEvent>((event, emit) async {
      try {
        emit(
          GetCatsSuccess(
            model: await repo.getCatsData(),
          ),
        );
      } catch (e) {
        emit(GetCatsErorr());
      }
    });
  }
  final GetCatsRepo repo;
}
