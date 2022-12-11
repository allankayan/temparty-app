import 'package:equatable/equatable.dart';

class TicketModel extends Equatable {
  String? ticketUid;
  String? userUid;
  String? eventUid;
  String? eventName;
  String? eventBanner;
  String? eventDate;

  TicketModel({
    this.ticketUid,
    this.userUid,
    this.eventUid,
    this.eventName,
    this.eventBanner,
    this.eventDate,
  });

  TicketModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    ticketUid = json['ticketUid'];
    userUid = json['userUid'];
    eventUid = json['eventUid'];
    eventName = json['eventName'];
    eventBanner = json['eventBanner'];
    eventDate = json['eventDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['ticketUid'] = ticketUid;
    data['userUid'] = userUid;
    data['eventUid'] = eventUid;
    data['eventName'] = eventName;
    data['eventBanner'] = eventBanner;
    data['eventDate'] = eventDate;

    return data;
  }

  TicketModel copyWith({
    String? ticketUid,
    String? userUid,
    String? eventUid,
    String? eventName,
    String? eventBanner,
    String? eventDate,
  }) {
    return TicketModel(
      ticketUid: ticketUid ?? this.ticketUid,
      userUid: userUid ?? this.userUid,
      eventUid: eventUid ?? this.eventUid,
      eventName: eventName ?? this.eventName,
      eventBanner: eventBanner ?? this.eventBanner,
      eventDate: eventDate ?? this.eventDate,
    );
  }

  @override
  List<Object?> get props => [
        ticketUid,
        userUid,
        eventUid,
        eventName,
        eventBanner,
        eventDate,
      ];
}
