import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/user_model.dart';

@injectable
class UserRemoteDataSource {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("users");
  late User? currentUser;

  UserRemoteDataSource() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        currentUser = FirebaseAuth.instance.currentUser;
      } else {
        null;
      }
    });
  }

  // Stream<UserModel?> streamUser() {
  //   dynamic snapshot;
  //   dynamic data;
  //   ref.child(currentUser!.uid).onValue.listen((DatabaseEvent event) {
  //     snapshot = event.snapshot.value;
  //     data = snapshot as Map<dynamic, dynamic>;
  //   });
  //   if (snapshot != null) return updateUser(data);
  //   return null;
  // }

  Future<UserModel?> getUserData() async {
    final snapshot = await ref.child(currentUser!.uid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    return UserModel.fromJson(data);
  }

  Future<void> createUserData(UserModel? user) async {
    await ref.child(user!.userUid!).set(user.toJson());
  }

  Future<void> updateUserData(UserModel? user) async {
    final data = jsonEncode(user);
    await ref.child(user!.userUid!).update(jsonDecode(data));
  }
}
