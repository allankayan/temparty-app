// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on _SearchControllerBase, Store {
  late final _$searchAtom =
      Atom(name: '_SearchControllerBase.search', context: context);

  @override
  TextEditingController get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(TextEditingController value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$filteredEventsAtom =
      Atom(name: '_SearchControllerBase.filteredEvents', context: context);

  @override
  ObservableList<EventModel> get filteredEvents {
    _$filteredEventsAtom.reportRead();
    return super.filteredEvents;
  }

  @override
  set filteredEvents(ObservableList<EventModel> value) {
    _$filteredEventsAtom.reportWrite(value, super.filteredEvents, () {
      super.filteredEvents = value;
    });
  }

  late final _$searchByEventNameAsyncAction =
      AsyncAction('_SearchControllerBase.searchByEventName', context: context);

  @override
  Future<void> searchByEventName(String name) {
    return _$searchByEventNameAsyncAction
        .run(() => super.searchByEventName(name));
  }

  @override
  String toString() {
    return '''
search: ${search},
filteredEvents: ${filteredEvents}
    ''';
  }
}
