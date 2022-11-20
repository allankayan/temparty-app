// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/data/data_sources/event/event_remote_data_source.dart' as _i3;
import '../app/data/data_sources/user/user_local_data_source.dart' as _i11;
import '../app/data/data_sources/user/user_remote_data_source.dart' as _i12;
import '../app/data/use_cases/auth/login.dart' as _i17;
import '../app/data/use_cases/auth/logout.dart' as _i18;
import '../app/data/use_cases/auth/register.dart' as _i19;
import '../app/data/use_cases/event/create_event.dart' as _i15;
import '../app/data/use_cases/event/get_event_by_uid.dart' as _i7;
import '../app/data/use_cases/event/get_event_list.dart' as _i8;
import '../app/data/use_cases/event/get_events_by_organizer_uid.dart' as _i9;
import '../app/data/use_cases/event/update_event.dart' as _i10;
import '../app/data/use_cases/user/get_user_data.dart' as _i16;
import '../app/data/use_cases/user/remove_profile_image.dart' as _i20;
import '../app/data/use_cases/user/update_organizer_account.dart' as _i21;
import '../app/data/use_cases/user/update_user_data.dart' as _i22;
import '../app/repositories/auth_repository.dart' as _i14;
import '../app/repositories/event_repository.dart' as _i4;
import '../app/repositories/user_repository.dart' as _i13;
import 'modules/local_module.dart' as _i24;
import 'modules/remote_module.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final remoteModule = _$RemoteModule();
  final localModule = _$LocalModule();
  gh.factory<_i3.EventRemoteDataSource>(() => _i3.EventRemoteDataSource());
  gh.factory<_i4.EventRepository>(
      () => _i4.EventRepository(get<_i3.EventRemoteDataSource>()));
  gh.singleton<_i5.FirebaseDatabase>(remoteModule.firebaseDatabase);
  gh.singleton<_i6.FlutterSecureStorage>(localModule.secureStorage);
  gh.singleton<_i7.GetEventByUid>(
      _i7.GetEventByUid(get<_i4.EventRepository>()));
  gh.singleton<_i8.GetEventList>(_i8.GetEventList(get<_i4.EventRepository>()));
  gh.singleton<_i9.GetEventsByOrganizerUid>(
      _i9.GetEventsByOrganizerUid(get<_i4.EventRepository>()));
  gh.singleton<_i10.UpdateEvent>(_i10.UpdateEvent(get<_i4.EventRepository>()));
  gh.factory<_i11.UserLocalDataSource>(
      () => _i11.UserLocalDataSource(get<_i6.FlutterSecureStorage>()));
  gh.factory<_i12.UserRemoteDataSource>(() => _i12.UserRemoteDataSource());
  gh.factory<_i13.UserRepository>(() => _i13.UserRepository(
        get<_i11.UserLocalDataSource>(),
        get<_i12.UserRemoteDataSource>(),
      ));
  gh.factory<_i14.AuthRepository>(
      () => _i14.AuthRepository(get<_i13.UserRepository>()));
  gh.singleton<_i15.CreateEvent>(_i15.CreateEvent(get<_i4.EventRepository>()));
  gh.singleton<_i16.GetUserData>(_i16.GetUserData(get<_i13.UserRepository>()));
  gh.singleton<_i17.Login>(_i17.Login(get<_i14.AuthRepository>()));
  gh.singleton<_i18.Logout>(_i18.Logout(get<_i14.AuthRepository>()));
  gh.singleton<_i19.Register>(_i19.Register(get<_i14.AuthRepository>()));
  gh.singleton<_i20.RemoveProfileImage>(
      _i20.RemoveProfileImage(get<_i13.UserRepository>()));
  gh.singleton<_i21.UpdateOrganizerAccount>(
      _i21.UpdateOrganizerAccount(get<_i13.UserRepository>()));
  gh.singleton<_i22.UpdateUserData>(
      _i22.UpdateUserData(get<_i13.UserRepository>()));
  return get;
}

class _$RemoteModule extends _i23.RemoteModule {}

class _$LocalModule extends _i24.LocalModule {}
