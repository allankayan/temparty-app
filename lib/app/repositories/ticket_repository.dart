import 'package:flutter_modular/flutter_modular.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/data_sources/ticket/ticket_local_data_source.dart';
import 'package:temparty/app/data/data_sources/ticket/ticket_remote_data_source.dart';
import 'package:temparty/app/data/model/ticket_model.dart';

@injectable
class TicketRepository {
  final TicketRemoteDataSource _ticketRemote;

  TicketRepository(this._ticketRemote);

  Future<void> createTicket(Map<String, String> data) async {
    final ticket = TicketModel.fromJson(data);

    await _ticketRemote.createTicket(ticket);
    Modular.to.pushNamed(
      "/tickets/ticket/",
      arguments: {
        "uid": ticket.ticketUid,
        "eventUid": ticket.eventUid,
      },
    );
  }

  Future<TicketModel> getTicketByUid(String ticketUid) async {
    return await _ticketRemote.getTicketByUid(ticketUid);
  }

  Future<List<TicketModel>> getTicketsByUserUid(String userUid) async {
    return await _ticketRemote.getTicketsByUserUid(userUid);
  }
}
