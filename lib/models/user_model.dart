class UserModel {
  String name;
  String gender;
  String goal;
  String birthYear;
  String height;
  String weight;

  UserModel({
    required this.name,
    required this.gender,
    required this.goal,
    required this.birthYear,
    required this.height,
    required this.weight,
  });

  factory UserModel.empty() {
    return UserModel(
      name: '',
      gender: '',
      goal: '',
      birthYear: '',
      height: '',
      weight: '',
    );
  }
}
