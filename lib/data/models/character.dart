class Character {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  Character({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
  });

  // Factory constructor to create an instance from JSON
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      title: json['title'] as String?,
      family: json['family'] as String?,
      image: json['image'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'title': title,
      'family': family,
      'image': image,
      'imageUrl': imageUrl,
    };
  }
}
