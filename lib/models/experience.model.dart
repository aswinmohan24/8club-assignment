class ExperienceModel {
  final List<Experience> experiences;

  ExperienceModel({required this.experiences});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      experiences: (json['data']['experiences'] as List<dynamic>)
          .map((e) => Experience.fromJson(e))
          .toList(),
    );
  }
}

class Experience {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;
  final String iconUrl;

  Experience({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
    required this.iconUrl,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      iconUrl: json['icon_url'] as String,
    );
  }
}
