// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchController on _SearchControllerBase, Store {
  late final _$valueAtom =
      Atom(name: '_SearchControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

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

  late final _$_SearchControllerBaseActionController =
      ActionController(name: '_SearchControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
search: ${search}
    ''';
  }
}
