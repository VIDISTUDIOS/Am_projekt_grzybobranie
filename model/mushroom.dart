class Mushroom {
  final String mushroomname;
  final String description;
  final String picture;
  
  const Mushroom({
    required this.mushroomname,
    required this.description,
    required this.picture,
  });
  static Mushroom fromJson(json) => Mushroom(
   mushroomname:json['mushroom'],
   description: json['description'],
   picture: json['picture'],
  );
}