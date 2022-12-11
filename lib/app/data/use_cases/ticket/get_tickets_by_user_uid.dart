import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:temparty/app/repositories/ticket_repository.dart';

@singleton
class GetTicketsByUserUid {
  final TicketRepository _ticketRepository;

  GetTicketsByUserUid(this._ticketRepository);

  Future<List<TicketModel>> getTicketsByUserUid(String userUid) async {
    return await _ticketRepository.getTicketsByUserUid(userUid);
  }
}
