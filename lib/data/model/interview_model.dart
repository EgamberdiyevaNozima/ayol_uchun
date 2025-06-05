class InterviewModel {
  final int id;
  final String user;
  final String title;
  final int duration;
  final String? image;

  InterviewModel({
    required this.id,
    required this.user,
    required this.title,
    required this.duration,
    this.image,
  });

  factory InterviewModel.fromJson(Map<String, dynamic> json) {
    return InterviewModel(
      id: json['id'] as int,
      user: json['user'] as String,
      title: json['title'] as String,
      duration: json['duration'] as int,
      image: json['image'] as String?, // optional bo‘lgani uchun
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'title': title,
      'duration': duration,
      if (image != null) 'image': image,
    };
  }
}
