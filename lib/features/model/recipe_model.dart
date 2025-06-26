class RecipeModel {
  final String title;
  final String image;
  final String description;
  final int kcal;

  final String? duration;
  final String? type;
  final int? carbs;
  final int? protein;
  final int? fats;

  final double? rating;
  final bool? isFavorite;

  RecipeModel({
    required this.title,
    required this.image,
    required this.description,
    required this.kcal,
    this.duration,
    this.type,
    this.carbs,
    this.protein,
    this.fats,
    this.rating,
    this.isFavorite,
  });

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      title: map['title'],
      image: map['image'],
      description: map['description'],
      kcal: map['kcal'],
      duration: map['duration'],
      type: map['type'],
      carbs: map['carbs'],
      protein: map['protein'],
      fats: map['fats'],
      rating: (map['rating'] as num?)?.toDouble(),
      isFavorite: map['isFavorite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'kcal': kcal,
      'duration': duration,
      'type': type,
      'carbs': carbs,
      'protein': protein,
      'fats': fats,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }
}
