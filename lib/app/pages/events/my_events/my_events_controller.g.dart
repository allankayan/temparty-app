// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyEventsController on _MyEventsControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_MyEventsControllerBase.user', context: context);

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

  late final _$eventsAtom =
      Atom(name: '_MyEventsControllerBase.events', context: context);

  @override
  ObservableFuture<List<EventModel>> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableFuture<List<EventModel>> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$refreshPageAsyncAction =
      AsyncAction('_MyEventsControllerBase.refreshPage', context: context);

  @override
  Future<void> refreshPage() {
    return _$refreshPageAsyncAction.run(() => super.refreshPage());
  }

  @override
  String toString() {
    return '''
user: ${user},
events: ${events}
    ''';
  }
}
