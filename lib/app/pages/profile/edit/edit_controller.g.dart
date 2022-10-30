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

  late final _$nameAtom =
      Atom(name: '_EditControllerBase.name', context: context);

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

  late final _$bioAtom =
      Atom(name: '_EditControllerBase.bio', context: context);

  @override
  TextEditingController get bio {
    _$bioAtom.reportRead();
    return super.bio;
  }

  @override
  set bio(TextEditingController value) {
    _$bioAtom.reportWrite(value, super.bio, () {
      super.bio = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_EditControllerBase.date', context: context);

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

  late final _$imageAtom =
      Atom(name: '_EditControllerBase.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$imageFromGalleryAsyncAction =
      AsyncAction('_EditControllerBase.imageFromGallery', context: context);

  @override
  Future<dynamic> imageFromGallery() {
    return _$imageFromGalleryAsyncAction.run(() => super.imageFromGallery());
  }

  late final _$imageFromCameraAsyncAction =
      AsyncAction('_EditControllerBase.imageFromCamera', context: context);

  @override
  Future<dynamic> imageFromCamera() {
    return _$imageFromCameraAsyncAction.run(() => super.imageFromCamera());
  }

  late final _$updateAccountAsyncAction =
      AsyncAction('_EditControllerBase.updateAccount', context: context);

  @override
  Future<void> updateAccount() {
    return _$updateAccountAsyncAction.run(() => super.updateAccount());
  }

  late final _$deleteProfileImageAsyncAction =
      AsyncAction('_EditControllerBase.deleteProfileImage', context: context);

  @override
  Future<void> deleteProfileImage() {
    return _$deleteProfileImageAsyncAction
        .run(() => super.deleteProfileImage());
  }

  late final _$refreshPageAsyncAction =
      AsyncAction('_EditControllerBase.refreshPage', context: context);

  @override
  Future<void> refreshPage() {
    return _$refreshPageAsyncAction.run(() => super.refreshPage());
  }

  @override
  String toString() {
    return '''
user: ${user},
name: ${name},
bio: ${bio},
date: ${date},
image: ${image}
    ''';
  }
}
