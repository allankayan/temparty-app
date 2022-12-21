import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:uuid/uuid.dart';

@injectable
class TicketRemoteDataSource {
  final CollectionReference tickets = FirebaseFirestore.instance.collection('tickets');
  var uuid = const Uuid();

  Future<void> createTicket(TicketModel ticket) async {
    ticket.ticketUid = uuid.v4();

    await tickets.doc(ticket.ticketUid!).set(ticket.toJson());
  }

  Future<TicketModel> getTicketByUid(String ticketUid) async {
    final snapshot = await tickets.doc(ticketUid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    return TicketModel.fromJson(data);
  }

  Future<List<TicketModel>> getTicketsByUserUid(String userUid) async {
    final snapshot = await tickets.where('userUid', isEqualTo: userUid).get();
    final list = snapshot.docs;
    var ticketList = <TicketModel>[];

    if (list.isNotEmpty) {
      for (var ticket in list) {
        final ticketData = ticket.data() as Map<String, dynamic>;
        ticketList.add(TicketModel.fromJson(ticketData));
      }
    }

    return ticketList;
  }
}
