import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/data_sources/event/event_remote_data_source.dart';
import 'package:temparty/app/data/model/event_model.dart';

@injectable
class EventRepository {
  final EventRemoteDataSource _eventRemote;

  EventRepository(this._eventRemote);

  Future<EventModel?> getEventByUid(String? eventUid) async {
    final event = await _eventRemote.getEventByUid(eventUid);
    return event;
  }

  Future<void> createEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    final eventData = jsonEncode(data);
    final event = EventModel.fromJson(jsonDecode(eventData));

    await _eventRemote.createEvent(event, profileImage, headerImage);
  }
}
