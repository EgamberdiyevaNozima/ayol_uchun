
import 'package:ayol_uchun_project/core/client.dart';
import 'package:ayol_uchun_project/core/exceptions/custom_Exception.dart';
import 'package:ayol_uchun_project/data/model/category_model.dart';
import 'package:ayol_uchun_project/data/model/interview_model.dart';
import 'package:ayol_uchun_project/data/model/social_accounts_model.dart';

class HomeRepository {
  final ApiClient client;

  HomeRepository({required this.client});

  Future<List<CategoryModel>> getHomeCategories() async {
    try {
      final data = await client.fetchHomeCategories(); // List<dynamic>
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw CustomException(message: "Kategoriyalarni olishda xatolik: ${e.toString()}");
    }
  }

  Future<List<InterviewModel>> getHomeInterviews() async {
    try {
      final data = await client.fetchHomeInterviews(); // List<dynamic>
      return data.map((json) => InterviewModel.fromJson(json)).toList();
    } catch (e) {
      throw CustomException(message: "Intervyularni olishda xatolik: ${e.toString()}");
    }
  }

  Future<List<SocialAccountModel>> getSocialAccounts() async {
    try {
      final data = await client.fetchHomeSocialAccounts(); // List<dynamic>
      return data.map((json) => SocialAccountModel.fromJson(json)).toList();
    } catch (e) {
      throw CustomException(message: "Ijtimoiy tarmoqlarni olishda xatolik: ${e.toString()}");
    }
  }
}
