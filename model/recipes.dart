class Recipe {
  final String recipename;
  final String description;
  final String picture;
  
  const Recipe({
    required this.recipename,
    required this.description,
    required this.picture,
  });
  static Recipe fromJson(json) => Recipe(
   recipename:json['recipe'],
   description: json['description'],
   picture: json['picture'],
  );
}