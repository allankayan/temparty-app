import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/data_sources/ticket/ticket_local_data_source.dart';
import 'package:temparty/app/data/data_sources/ticket/ticket_remote_data_source.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:uuid/uuid.dart';

@injectable
class TicketRepository {
  final TicketLocalDataSource _ticketLocal;
  final TicketRemoteDataSource _ticketRemote;

  TicketRepository(this._ticketLocal, this._ticketRemote);

  Future<void> createTicket(Map<String, String> data) async {
    final ticket = TicketModel.fromJson(data);

    await _ticketRemote.createTicket(ticket);
  }

  Future<List<TicketModel>> getTicketsByUserUid(String userUid) async {
    return await _ticketRemote.getTicketsByUserUid(userUid);
  }
}
