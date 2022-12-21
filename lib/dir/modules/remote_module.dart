import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteModule {
  @singleton
  FirebaseFirestore get firebaseDatabase => FirebaseFirestore.instance;
}
