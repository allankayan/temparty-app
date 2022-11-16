import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class EventRemoteDataSource {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("events");
  final Reference storage = FirebaseStorage.instance.ref().child("events");
  var uuid = const Uuid();

  Future<EventModel> getEventByUid(String eventUid) async {
    final snapshot = await ref.child(eventUid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    return EventModel.fromJson(data);
  }

  Future<void> createEvent(EventModel? event, XFile? profileImage, XFile? headerImage) async {
    event!.eventUid = uuid.v4();

    if (profileImage != null) {
      final profileImageRef = storage.child(event.eventUid!).child("profileImage.jpg");
      final selectedImage = File(profileImage.path);

      await profileImageRef.putFile(selectedImage);
      final url = await profileImageRef.getDownloadURL();
      event.profileImage = url;
    }

    if (headerImage != null) {
      final headerImageRef = storage.child(event.eventUid!).child("headerImage.jpg");
      final selectedImage = File(headerImage.path);

      await headerImageRef.putFile(selectedImage);
      final url = await headerImageRef.getDownloadURL();
      event.headerImage = url;
    }

    await ref.child(event.eventUid!).set(event.toJson());
  }
}
