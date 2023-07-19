import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseUtils {
  static Future<String?> uploadImageToFirebase(
      {required String folder, required File image}) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("$folder/${DateTime.now().millisecondsSinceEpoch}.png");

    try {
      return await storageRef.putFile(image).then((value) async {
        if (value.state == TaskState.success) {
          debugPrint("Image uploaded");
          String imageUrl = await value.ref.getDownloadURL();
          return imageUrl;
        }
        return null;
      });
    } catch (e) {
      debugPrint("Image upload error $e");
    }

    return null;
  }

  static Future<void> setDataToFirebase({
    required String collectionPath,
    required String doc,
    required Map<String, dynamic> data,
  }) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(collectionPath).doc(doc);

    await documentReference.set(data);
  }

  static Future<Map<String, dynamic>> retreiveDataFromFirebase({
    required String collectionPath,
    required String doc,
  }) async {
    Map<String, dynamic> data = {};
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(collectionPath).doc(doc);

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists && snapshot.data() != null) {
      data = snapshot.data() as Map<String, dynamic>;
    }

    return data;
  }
}
