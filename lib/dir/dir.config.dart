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
import '../app/data/data_sources/user/user_local_data_source.dart' as _i7;
import '../app/data/data_sources/user/user_remote_data_source.dart' as _i8;
import '../app/data/use_cases/auth/login.dart' as _i13;
import '../app/data/use_cases/auth/logout.dart' as _i14;
import '../app/data/use_cases/auth/register.dart' as _i15;
import '../app/data/use_cases/event/create_event.dart' as _i11;
import '../app/data/use_cases/user/get_user_data.dart' as _i12;
import '../app/data/use_cases/user/remove_profile_image.dart' as _i16;
import '../app/data/use_cases/user/update_organizer_account.dart' as _i17;
import '../app/data/use_cases/user/update_user_data.dart' as _i18;
import '../app/repositories/auth_repository.dart' as _i10;
import '../app/repositories/event_repository.dart' as _i4;
import '../app/repositories/user_repository.dart' as _i9;
import 'modules/local_module.dart' as _i20;
import 'modules/remote_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.UserLocalDataSource>(
      () => _i7.UserLocalDataSource(get<_i6.FlutterSecureStorage>()));
  gh.factory<_i8.UserRemoteDataSource>(() => _i8.UserRemoteDataSource());
  gh.factory<_i9.UserRepository>(() => _i9.UserRepository(
        get<_i7.UserLocalDataSource>(),
        get<_i8.UserRemoteDataSource>(),
      ));
  gh.factory<_i10.AuthRepository>(
      () => _i10.AuthRepository(get<_i9.UserRepository>()));
  gh.singleton<_i11.CreateEvent>(_i11.CreateEvent(get<_i4.EventRepository>()));
  gh.singleton<_i12.GetUserData>(_i12.GetUserData(get<_i9.UserRepository>()));
  gh.singleton<_i13.Login>(_i13.Login(get<_i10.AuthRepository>()));
  gh.singleton<_i14.Logout>(_i14.Logout(get<_i10.AuthRepository>()));
  gh.singleton<_i15.Register>(_i15.Register(get<_i10.AuthRepository>()));
  gh.singleton<_i16.RemoveProfileImage>(
      _i16.RemoveProfileImage(get<_i9.UserRepository>()));
  gh.singleton<_i17.UpdateOrganizerAccount>(
      _i17.UpdateOrganizerAccount(get<_i9.UserRepository>()));
  gh.singleton<_i18.UpdateUserData>(
      _i18.UpdateUserData(get<_i9.UserRepository>()));
  return get;
}

class _$RemoteModule extends _i19.RemoteModule {}

class _$LocalModule extends _i20.LocalModule {}
