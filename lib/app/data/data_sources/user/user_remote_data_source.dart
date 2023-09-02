import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRemoteDataSource {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  final Reference storage = FirebaseStorage.instance.ref().child("profile_images");

  Future<UserModel?> getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final snapshot = await users.doc(currentUser!.uid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel.fromJson(data);
  }

  Future<void> createUserData(UserModel? user) async {
    await users.doc(user!.userUid!).set(user.toJson());
  }

  Future<void> updateUserData(Map<String, String> user, XFile? image) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (image != null) {
      final imageRef = storage.child("${currentUser!.uid}.jpg");
      final selectedImage = File(image.path);

      await imageRef.putFile(selectedImage);
      final url = await imageRef.getDownloadURL();
      user.update('profileImage', (value) => url, ifAbsent: () => url);
    }

    await users.doc(currentUser!.uid).update(user);
  }

  Future<void> removeUserProfileImage() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final imageRef = storage.child("${currentUser!.uid}.jpg");
    await imageRef.delete();
    await users.doc(currentUser.uid).update({'profileImage': FieldValue.delete()});
  }

  Future<void> updateOrganizerAccount(bool? value) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    await users.doc(currentUser!.uid).update({'isOrganizer': value});
  }
}
