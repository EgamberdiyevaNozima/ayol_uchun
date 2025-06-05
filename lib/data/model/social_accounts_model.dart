class SocialAccountModel {
  final int id;
  final String title;
  final String link;
  final String icon;

  SocialAccountModel({
    required this.id,
    required this.title,
    required this.link,
    required this.icon,
  });

  factory SocialAccountModel.fromJson(Map<String, dynamic> json) {
    return SocialAccountModel(
      id: json['id'] as int,
      title: json['title'] as String,
      link: json['link'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
      'icon': icon,
    };
  }
}
