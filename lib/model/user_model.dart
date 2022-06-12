import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
   final String? uid;
   final String? username;
   final String? email;
   final String? phoneNumber;
   final String? streetAddress;
   final String? city;
   final String? country;
   final String? zipCode;

  const MyUser(
      {this.uid,
      this.username,
      this.email,
      this.phoneNumber,
      this.streetAddress,
      this.city,
      this.country,
      this.zipCode});

  static MyUser formSnapshot(DocumentSnapshot snapshot) {
    MyUser myUser = MyUser(
        email: snapshot["email"],
        phoneNumber: snapshot["phoneNumber"],
        uid: snapshot["uid"],
        username: snapshot["username"],
        streetAddress: snapshot["streetAddress"],
        city: snapshot["city"],
        country: snapshot["country"],
        zipCode: snapshot["zipCode"]);
    return myUser;
  }

   static String userAddress() {
    MyUser user = MyUser();
    return user.streetAddress! +
        "," +
        user.city! +
        "," +
        user.country! +
        "," +
        user.zipCode!;
  }

  // form firebase
  factory MyUser.fromMap(map) {
    return MyUser(
        uid: map["uid"],
        username: map["username"],
        email: map["email"],
        phoneNumber: map["phoneNumber"],
        streetAddress: map["streetAddress"],
        city: map["city"],
        country: map["country"],
        zipCode: map["zipCode"]);
  }

  // sending to firebase
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "streetAddress": streetAddress,
      "city": city,
      "country": country,
      "zipCode": zipCode,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [username, email, phoneNumber, city, country, zipCode, streetAddress];
}
