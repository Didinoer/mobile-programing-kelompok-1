import 'package:hive_flutter/hive_flutter.dart';
part 'modelakun.g.dart';

@HiveType(typeId: 1)
class akun {
  @HiveField(0)
  final String nama_akun;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;

  akun(
      {required this.nama_akun,
      required this.username,
      required this.email,
      required this.password});

  factory akun.fromJson(Map<String, dynamic> json) {
    return akun(
      nama_akun: json['nama_akun'],
      username: json['username'],
      //id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['nama_akun'] = nama_akun;
//     data['username'] = username;
//     //data['id'] = id;
//     data['email'] = email;
//     data['password'] = password;
//     return data;
//   }
// }
