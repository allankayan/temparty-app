// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/data/data_sources/user/user_local_data_source.dart' as _i5;
import '../app/data/data_sources/user/user_remote_data_source.dart' as _i6;
import '../app/data/use_cases/auth/login.dart' as _i10;
import '../app/data/use_cases/auth/logout.dart' as _i11;
import '../app/data/use_cases/auth/register.dart' as _i12;
import '../app/data/use_cases/user/get_user_data.dart' as _i9;
import '../app/data/use_cases/user/remove_profile_image.dart' as _i13;
import '../app/data/use_cases/user/update_organizer_account.dart' as _i14;
import '../app/data/use_cases/user/update_user_data.dart' as _i15;
import '../app/repositories/auth_repository.dart' as _i8;
import '../app/repositories/user_repository.dart' as _i7;
import 'modules/local_module.dart' as _i17;
import 'modules/remote_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.FirebaseDatabase>(remoteModule.firebaseDatabase);
  gh.singleton<_i4.FlutterSecureStorage>(localModule.secureStorage);
  gh.factory<_i5.UserLocalDataSource>(
      () => _i5.UserLocalDataSource(get<_i4.FlutterSecureStorage>()));
  gh.factory<_i6.UserRemoteDataSource>(() => _i6.UserRemoteDataSource());
  gh.factory<_i7.UserRepository>(() => _i7.UserRepository(
        get<_i5.UserLocalDataSource>(),
        get<_i6.UserRemoteDataSource>(),
      ));
  gh.factory<_i8.AuthRepository>(
      () => _i8.AuthRepository(get<_i7.UserRepository>()));
  gh.singleton<_i9.GetUserData>(_i9.GetUserData(get<_i7.UserRepository>()));
  gh.singleton<_i10.Login>(_i10.Login(get<_i8.AuthRepository>()));
  gh.singleton<_i11.Logout>(_i11.Logout(get<_i8.AuthRepository>()));
  gh.singleton<_i12.Register>(_i12.Register(get<_i8.AuthRepository>()));
  gh.singleton<_i13.RemoveProfileImage>(
      _i13.RemoveProfileImage(get<_i7.UserRepository>()));
  gh.singleton<_i14.UpdateOrganizerAccount>(
      _i14.UpdateOrganizerAccount(get<_i7.UserRepository>()));
  gh.singleton<_i15.UpdateUserData>(
      _i15.UpdateUserData(get<_i7.UserRepository>()));
  return get;
}

class _$RemoteModule extends _i16.RemoteModule {}

class _$LocalModule extends _i17.LocalModule {}
