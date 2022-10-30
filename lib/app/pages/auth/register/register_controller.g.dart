// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on _RegisterControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_RegisterControllerBase.name', context: context);

  @override
  TextEditingController get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(TextEditingController value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterControllerBase.email', context: context);

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterControllerBase.password', context: context);

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVerificationAtom = Atom(
      name: '_RegisterControllerBase.passwordVerification', context: context);

  @override
  TextEditingController get passwordVerification {
    _$passwordVerificationAtom.reportRead();
    return super.passwordVerification;
  }

  @override
  set passwordVerification(TextEditingController value) {
    _$passwordVerificationAtom.reportWrite(value, super.passwordVerification,
        () {
      super.passwordVerification = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_RegisterControllerBase.date', context: context);

  @override
  TextEditingController get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(TextEditingController value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$createAccountAsyncAction =
      AsyncAction('_RegisterControllerBase.createAccount', context: context);

  @override
  Future<void> createAccount() {
    return _$createAccountAsyncAction.run(() => super.createAccount());
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
passwordVerification: ${passwordVerification},
date: ${date}
    ''';
  }
}
