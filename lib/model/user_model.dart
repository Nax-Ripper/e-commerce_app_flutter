import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  String? uid;
  String? username;
  String? email;
  String? phoneNumber;

  MyUser({
     this.uid,
     this.username,
     this.email,
     this.phoneNumber,
  });

  // form firebase
  factory MyUser.fromMap(map) {
    return MyUser(
        uid: map["uid"],
        username: map["username"],
        email: map["email"],
        phoneNumber: map["phoneNumber"]);
  }

  // sending to firebase 
  Map<String, dynamic> toMap() {
    return {
      "uid":uid,
      "username":username,
      "email":email,
      "phoneNumber":phoneNumber

    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, phoneNumber];
}
