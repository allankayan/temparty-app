import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/repositories/event_repository.dart';

@singleton
class GetEventsByOrganizerUid {
  final EventRepository _eventRepository;

  GetEventsByOrganizerUid(this._eventRepository);

  Future<List<EventModel>> getEventsByOrganizerUid(String organizerUid) async {
    return await _eventRepository.getEventsByOrganizerUid(organizerUid);
  }
}
