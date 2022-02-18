class AppUser {
  AppUser({this.favoriteAnimal});

  String? favoriteAnimal;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        favoriteAnimal: json["favoriteAnimal"],
      );

  static AppUser fromFirestore(Object data) {
    final Map<String, dynamic> dataMap = data as Map<String, dynamic>;
    return AppUser.fromJson(dataMap);
  }
}
