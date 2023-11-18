class Food {
  final String foodName;
  final double rating;
  final int time;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  Food({
    required this.foodName,
    required this.rating,
    required this.time,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      foodName: map['foodname'] ?? '',
      rating: map['rating'] ?? 0.0,
      time: map['time'] ?? 0,
      imageUrl: map['imageurl'] ?? '',
      ingredients: map['ingredients'] != null
          ? List<String>.from(map['ingredients'])
          : [],
      steps: map['steps'] != null ? List<String>.from(map['steps']) : [],
    );
  }
}
