import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  

  // final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    // var bucket = "gs://msms-d38b8.appspot.com";
    // await storage.ref("product_images/${image.name}").putFile(File(image.path));
   
    // storage.bucket = bucket;
     await storage
        .ref()
        .child("product_images/${image.name}")
        .putFile(File(image.path));


  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref("product_images/$imageName").getDownloadURL();

    return downloadURL;
  }
}
