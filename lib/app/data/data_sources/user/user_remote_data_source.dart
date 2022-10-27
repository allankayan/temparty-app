import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRemoteDataSource {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
  late User? currentUser = FirebaseAuth.instance.currentUser;

  Future<UserModel?> getUserData() async {
    final snapshot = await ref.child(currentUser!.uid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    return UserModel.fromJson(data);
  }

  Future<void> createUserData(UserModel? user) async {
    await ref.child(user!.userUid!).set(user.toJson());
  }

  Future<void> updateUserData(Map<String, String>? user) async {
    await ref.child(currentUser!.uid).update(user!);
  }
}
