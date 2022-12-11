import 'package:equatable/equatable.dart';

class TicketModel extends Equatable {
  String? ticketUid;
  String? eventUid;
  String? userUid;

  TicketModel({
    this.ticketUid,
    this.eventUid,
    this.userUid,
  });

  TicketModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    ticketUid = json['ticketUid'];
    eventUid = json['eventUid'];
    userUid = json['userUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['ticketUid'] = ticketUid;
    data['eventUid'] = eventUid;
    data['userUid'] = userUid;

    return data;
  }

  TicketModel copyWith({
    String? ticketUid,
    String? eventUid,
    String? userUid,
  }) {
    return TicketModel(
      ticketUid: ticketUid ?? this.ticketUid,
      eventUid: eventUid ?? this.eventUid,
      userUid: userUid ?? this.userUid,
    );
  }

  @override
  List<Object?> get props => [
        ticketUid,
        eventUid,
        userUid,
      ];
}
