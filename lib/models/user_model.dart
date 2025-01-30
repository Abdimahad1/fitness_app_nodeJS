class UserModel {
  String id;
  String name;
  String gender;
  String goal;
  String birthYear;
  String height;
  String weight;

  UserModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.goal,
    required this.birthYear,
    required this.height,
    required this.weight,
  });

  factory UserModel.empty() {
    return UserModel(
      id: '',
      name: '',
      gender: '',
      goal: '',
      birthYear: '',
      height: '',
      weight: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'goal': goal,
      'birthYear': birthYear,
      'height': height,
      'weight': weight,
    };
  }
}
