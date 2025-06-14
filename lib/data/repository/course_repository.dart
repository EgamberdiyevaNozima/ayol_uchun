import 'package:ayol_uchun_project/core/client.dart';
import 'package:ayol_uchun_project/core/exceptions/custom_Exception.dart';
import 'package:ayol_uchun_project/data/model/course_model.dart';

class CourseRepository {
  final ApiClient client;

  CourseRepository({required this.client});

  Future<List<CourseModel>> getAllCourses() async {
    try {
      final data = await client.fetchAllCourses(); // List<dynamic>
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } catch (e) {
      throw CustomException(message: "Kategoriyalarni olishda xatolik: ${e.toString()}");
    }
  }
}
