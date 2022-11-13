import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/event_repository.dart';

@singleton
class CreateEvent {
  final EventRepository _eventRepository;

  CreateEvent(this._eventRepository);

  Future<void> createEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    await _eventRepository.createEvent(data, profileImage, headerImage);
  }
}
