class CategoryModel {
  final int id;
  final String title;
  final String icon;
  final int totalCourses;

  CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.totalCourses,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      title: json['title'] as String,
      icon: json['icon'] as String,
      totalCourses: json['totalCourses'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'totalCourses': totalCourses,
    };
  }
}
