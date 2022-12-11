import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:temparty/app/data/model/ticket_model.dart';
import 'package:uuid/uuid.dart';

@injectable
class TicketRemoteDataSource {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child("tickets");
  var uuid = const Uuid();

  Future<void> createTicket(TicketModel ticket) async {
    ticket.ticketUid = uuid.v4();

    await ref.child(ticket.ticketUid!).set(ticket.toJson());
  }

  Future<List<TicketModel>> getTicketsByUserUid(String userUid) async {
    final snapshot = await ref.orderByChild("userUid").equalTo(userUid).get();
    final data = snapshot.value as Map?;
    var ticketList = <TicketModel>[];

    if (data != null) {
      data.forEach((key, value) {
        ticketList.add(TicketModel.fromJson(value));
      });
    }

    return ticketList;
  }
}
