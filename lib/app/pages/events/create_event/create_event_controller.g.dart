// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEventController on _CreateEventControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_CreateEventControllerBase.name', context: context);

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

  late final _$addressAtom =
      Atom(name: '_CreateEventControllerBase.address', context: context);

  @override
  TextEditingController get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(TextEditingController value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$cityAtom =
      Atom(name: '_CreateEventControllerBase.city', context: context);

  @override
  TextEditingController get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(TextEditingController value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$observationsAtom =
      Atom(name: '_CreateEventControllerBase.observations', context: context);

  @override
  TextEditingController get observations {
    _$observationsAtom.reportRead();
    return super.observations;
  }

  @override
  set observations(TextEditingController value) {
    _$observationsAtom.reportWrite(value, super.observations, () {
      super.observations = value;
    });
  }

  late final _$zipcodeAtom =
      Atom(name: '_CreateEventControllerBase.zipcode', context: context);

  @override
  TextEditingController get zipcode {
    _$zipcodeAtom.reportRead();
    return super.zipcode;
  }

  @override
  set zipcode(TextEditingController value) {
    _$zipcodeAtom.reportWrite(value, super.zipcode, () {
      super.zipcode = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_CreateEventControllerBase.date', context: context);

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

  late final _$profileImageAtom =
      Atom(name: '_CreateEventControllerBase.profileImage', context: context);

  @override
  XFile? get profileImage {
    _$profileImageAtom.reportRead();
    return super.profileImage;
  }

  @override
  set profileImage(XFile? value) {
    _$profileImageAtom.reportWrite(value, super.profileImage, () {
      super.profileImage = value;
    });
  }

  late final _$headerImageAtom =
      Atom(name: '_CreateEventControllerBase.headerImage', context: context);

  @override
  XFile? get headerImage {
    _$headerImageAtom.reportRead();
    return super.headerImage;
  }

  @override
  set headerImage(XFile? value) {
    _$headerImageAtom.reportWrite(value, super.headerImage, () {
      super.headerImage = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_CreateEventControllerBase.user', context: context);

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

  late final _$btnControllerAtom =
      Atom(name: '_CreateEventControllerBase.btnController', context: context);

  @override
  RoundedLoadingButtonController get btnController {
    _$btnControllerAtom.reportRead();
    return super.btnController;
  }

  @override
  set btnController(RoundedLoadingButtonController value) {
    _$btnControllerAtom.reportWrite(value, super.btnController, () {
      super.btnController = value;
    });
  }

  late final _$imageFromGalleryAsyncAction = AsyncAction(
      '_CreateEventControllerBase.imageFromGallery',
      context: context);

  @override
  Future<dynamic> imageFromGallery(String imageType) {
    return _$imageFromGalleryAsyncAction
        .run(() => super.imageFromGallery(imageType));
  }

  late final _$imageFromCameraAsyncAction = AsyncAction(
      '_CreateEventControllerBase.imageFromCamera',
      context: context);

  @override
  Future<dynamic> imageFromCamera(String imageType) {
    return _$imageFromCameraAsyncAction
        .run(() => super.imageFromCamera(imageType));
  }

  late final _$newEventAsyncAction =
      AsyncAction('_CreateEventControllerBase.newEvent', context: context);

  @override
  Future<void> newEvent() {
    return _$newEventAsyncAction.run(() => super.newEvent());
  }

  @override
  String toString() {
    return '''
name: ${name},
address: ${address},
city: ${city},
observations: ${observations},
zipcode: ${zipcode},
date: ${date},
profileImage: ${profileImage},
headerImage: ${headerImage},
user: ${user},
btnController: ${btnController}
    ''';
  }
}
