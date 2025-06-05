import 'package:ayol_uchun_project/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
      LoadHomeData event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());
    try {
      final categories = await repository.getHomeCategories();
      final interviews = await repository.getHomeInterviews();
      final socialAccounts = await repository.getSocialAccounts();

      emit(HomeLoaded(
        categories: categories,
        interviews: interviews,
        socialAccounts: socialAccounts,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
