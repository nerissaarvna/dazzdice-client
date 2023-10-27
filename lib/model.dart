class User {
  String id;
  String name;

  User({required this.id, required this.name});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
