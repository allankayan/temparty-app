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

  Future<List<EventModel>> getEventList() async {
    final snapshot = await ref.get();
    final data = snapshot.value as Map?;
    var eventList = <EventModel>[];

    data!.forEach((key, value) {
      eventList.add(EventModel.fromJson(value));
    });

    return eventList;
  }

  Future<EventModel> getEventByUid(String eventUid) async {
    final snapshot = await ref.child(eventUid).get();
    final data = snapshot.value as Map<dynamic, dynamic>;

    return EventModel.fromJson(data);
  }

  Future<List<EventModel>> getEventsByOrganizerUid(String organizerUid) async {
    final snapshot = await ref.orderByChild("organizerUid").equalTo(organizerUid).get();
    final data = snapshot.value as Map?;
    var eventList = <EventModel>[];

    data!.forEach((key, value) {
      eventList.add(EventModel.fromJson(value));
    });

    return eventList;
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

  Future<void> updateEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    EventModel event = EventModel.fromJson(data);

    if (profileImage != null) {
      final profileImageRef = storage.child(event.eventUid!).child("profileImage.jpg");
      final selectedImage = File(profileImage.path);

      await profileImageRef.putFile(selectedImage);
      final url = await profileImageRef.getDownloadURL();
      data.update('profileImage', (value) => url, ifAbsent: () => url);
    }

    if (headerImage != null) {
      final headerImageRef = storage.child(event.eventUid!).child("headerImage.jpg");
      final selectedImage = File(headerImage.path);

      await headerImageRef.putFile(selectedImage);
      final url = await headerImageRef.getDownloadURL();
      data.update('headerImage', (value) => url, ifAbsent: () => url);
    }

    await ref.child(event.eventUid!).update(data);
  }
}
