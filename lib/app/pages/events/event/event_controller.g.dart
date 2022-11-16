// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventController on _EventControllerBase, Store {
  late final _$eventAtom =
      Atom(name: '_EventControllerBase.event', context: context);

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

  late final _$userAtom =
      Atom(name: '_EventControllerBase.user', context: context);

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

  @override
  String toString() {
    return '''
event: ${event},
user: ${user}
    ''';
  }
}
