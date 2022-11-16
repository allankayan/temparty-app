import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/repositories/event_repository.dart';

@singleton
class GetEventByUid {
  final EventRepository _eventRepository;

  GetEventByUid(this._eventRepository);

  Future<EventModel> getEventByUid({required String eventUid}) async {
    return await _eventRepository.getEventByUid(eventUid);
  }
}
