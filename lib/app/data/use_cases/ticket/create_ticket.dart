import 'package:injectable/injectable.dart';
import 'package:temparty/app/repositories/ticket_repository.dart';

@singleton
class CreateTicket {
  final TicketRepository _ticketRepository;

  CreateTicket(this._ticketRepository);

  Future<void> createTicket(Map<String, String> data) async {
    await _ticketRepository.createTicket(data);
  }
}
