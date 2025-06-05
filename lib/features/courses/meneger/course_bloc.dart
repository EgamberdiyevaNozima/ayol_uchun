import 'package:ayol_uchun_project/data/repository/course_repository.dart';
import 'package:ayol_uchun_project/features/courses/meneger/course_event.dart';
import 'package:ayol_uchun_project/features/courses/meneger/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository repository;

  CourseBloc({required this.repository}) : super(CourseInitial()) {
    on<LoadCourseData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
      LoadCourseData event,
      Emitter<CourseState> emit,
      ) async {
    emit(CourseLoading());
    try {
      final courses = await repository.getAllCourses();

      emit(CourseLoaded(
        courses: courses
      ));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}
