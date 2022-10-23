// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditController on _EditControllerBase, Store {
  late final _$userAtom =
      Atom(name: '_EditControllerBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$updateAccountAsyncAction =
      AsyncAction('_EditControllerBase.updateAccount', context: context);

  @override
  Future<void> updateAccount(String newName, String newEmail) {
    return _$updateAccountAsyncAction
        .run(() => super.updateAccount(newName, newEmail));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
