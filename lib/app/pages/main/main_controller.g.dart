// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainController on _MainControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_MainControllerBase.user', context: context);

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

  late final _$refreshPageAsyncAction =
      AsyncAction('_MainControllerBase.refreshPage', context: context);

  @override
  Future<void> refreshPage() {
    return _$refreshPageAsyncAction.run(() => super.refreshPage());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
