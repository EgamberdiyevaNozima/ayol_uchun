import 'package:ayol_uchun_project/data/model/category_model.dart';
import 'package:ayol_uchun_project/data/model/interview_model.dart';
import 'package:ayol_uchun_project/data/model/social_accounts_model.dart';
import 'package:equatable/equatable.dart';
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<InterviewModel> interviews;
  final List<SocialAccountModel> socialAccounts;

  const HomeLoaded({
    required this.categories,
    required this.interviews,
    required this.socialAccounts,
  });

  @override
  List<Object?> get props => [categories, interviews, socialAccounts];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
