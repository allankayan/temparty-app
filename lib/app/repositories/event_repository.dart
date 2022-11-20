import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/data_sources/event/event_remote_data_source.dart';
import 'package:temparty/app/data/model/event_model.dart';

@injectable
class EventRepository {
  final EventRemoteDataSource _eventRemote;

  EventRepository(this._eventRemote);

  Future<List<EventModel>> getEventList() async {
    return await _eventRemote.getEventList();
  }

  Future<EventModel> getEventByUid(String eventUid) async {
    return await _eventRemote.getEventByUid(eventUid);
  }

  Future<List<EventModel>> getEventsByOrganizerUid(String organizerUid) async {
    return await _eventRemote.getEventsByOrganizerUid(organizerUid);
  }

  Future<void> createEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    final eventData = jsonEncode(data);
    final event = EventModel.fromJson(jsonDecode(eventData));

    await _eventRemote.createEvent(event, profileImage, headerImage);
    Modular.to.popAndPushNamed('/events/event/', arguments: event.eventUid);
  }

  Future<void> updateEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    await _eventRemote.updateEvent(data, profileImage, headerImage);
  }
}
