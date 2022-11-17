import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/event_model.dart';
import 'package:temparty/app/repositories/event_repository.dart';

@singleton
class GetEventList {
  final EventRepository _eventRepository;

  GetEventList(this._eventRepository);

  Future<List<EventModel>> getEventList() async {
    return await _eventRepository.getEventList();
  }
}
