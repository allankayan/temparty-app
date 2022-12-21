import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class EventRemoteDataSource {
  final CollectionReference events = FirebaseFirestore.instance.collection('events');
  final Reference storage = FirebaseStorage.instance.ref().child("events");
  var uuid = const Uuid();

  Future<List<EventModel>> getEventList() async {
    final snapshot = await events.get();
    final list = snapshot.docs;
    var eventList = <EventModel>[];

    if (list.isNotEmpty) {
      for (var event in list) {
        final eventData = event.data() as Map<String, dynamic>;
        eventList.add(EventModel.fromJson(eventData));
      }
    }

    return eventList;
  }

  Future<EventModel> getEventByUid(String eventUid) async {
    final snapshot = await events.doc(eventUid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    return EventModel.fromJson(data);
  }

  Future<List<EventModel>> getEventsByOrganizerUid(String organizerUid) async {
    final snapshot = await events.where('organizerUid', isEqualTo: organizerUid).get();
    final list = snapshot.docs;
    var eventList = <EventModel>[];

    if (list.isNotEmpty) {
      for (var event in list) {
        final eventData = event.data() as Map<String, dynamic>;
        eventList.add(EventModel.fromJson(eventData));
      }
    }

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

    await events.doc(event.eventUid!).set(event.toJson());
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

    await events.doc(event.eventUid!).update(data);
  }
}
