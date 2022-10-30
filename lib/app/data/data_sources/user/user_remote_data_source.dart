import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRemoteDataSource {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
  final Reference storage = FirebaseStorage.instance.ref().child("profile_images");

  Future<UserModel?> getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final snapshot = await ref.child(currentUser!.uid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    return UserModel.fromJson(data);
  }

  Future<void> createUserData(UserModel? user) async {
    await ref.child(user!.userUid!).set(user.toJson());
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

    await ref.child(currentUser!.uid).update(user);
  }

  Future<void> removeUserProfileImage() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final imageRef = storage.child("${currentUser!.uid}.jpg");
    await imageRef.delete();
    await ref.child(currentUser.uid).child('profileImage').remove();
  }
}
