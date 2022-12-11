// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TicketController on _TicketControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_TicketControllerBase.user', context: context);

  @override
  ObservableFuture<UserModel> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableFuture<UserModel> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$ticketAtom =
      Atom(name: '_TicketControllerBase.ticket', context: context);

  @override
  ObservableFuture<TicketModel> get ticket {
    _$ticketAtom.reportRead();
    return super.ticket;
  }

  @override
  set ticket(ObservableFuture<TicketModel> value) {
    _$ticketAtom.reportWrite(value, super.ticket, () {
      super.ticket = value;
    });
  }

  late final _$eventAtom =
      Atom(name: '_TicketControllerBase.event', context: context);

  @override
  ObservableFuture<EventModel> get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(ObservableFuture<EventModel> value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
ticket: ${ticket},
event: ${event}
    ''';
  }
}
