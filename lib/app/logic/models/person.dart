class UserModel {
  final double time;
  final String email;
  final Map<String, dynamic> latLng;
  final String name;
  final List<dynamic> crossFaces;
  UserModel(
      {required this.time,
      required this.email,
      required this.crossFaces,
      required this.latLng,
      required this.name});

  Map<String, dynamic> toJson() => {
        'time': time,
        'email': email,
        'latLng': latLng,
        'name': name,
        "crossFaces": crossFaces
      };

  static UserModel get empty =>
      UserModel(time: 0, email: '', crossFaces: [], latLng: {}, name: '');

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      time: double.parse(json['time'].toString()),
      email: json['email'],
      latLng: json['latLng'],
      name: json['name'],
      crossFaces: json['crossFaces']);
}
