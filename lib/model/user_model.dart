import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  late final String? uid;
  late final String? username;
  late final String? email;
  late final String? phoneNumber;

  MyUser({
     this.uid,
     this.username,
     this.email,
     this.phoneNumber,
  });

  static MyUser formSnapshot(DocumentSnapshot snapshot) {
    MyUser myUser = MyUser(
        email: snapshot["email"],
        phoneNumber: snapshot["phoneNumber"],
        uid: snapshot["uid"],
        username: snapshot["username"]);
    return myUser;
  }

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
      "uid": uid,
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, phoneNumber];
}
