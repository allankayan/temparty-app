import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/repositories/ticket_repository.dart';

@singleton
class GetTicketByUid {
  final TicketRepository _ticketRepository;

  GetTicketByUid(this._ticketRepository);

  Future<TicketModel> getTicketByUid({required String ticketUid}) async {
    return await _ticketRepository.getTicketByUid(ticketUid);
  }
}
