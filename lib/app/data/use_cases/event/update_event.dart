import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/event_repository.dart';

@singleton
class UpdateEvent {
  final EventRepository _eventRepository;

  UpdateEvent(this._eventRepository);

  Future<void> updateEvent(
      Map<String, String> data, XFile? profileImage, XFile? headerImage) async {
    await _eventRepository.updateEvent(data, profileImage, headerImage);
  }
}
