// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/data/local/user_local_storage.dart' as _i4;
import '../app/data/use_cases/auth/login.dart' as _i8;
import '../app/data/use_cases/auth/logout.dart' as _i9;
import '../app/data/use_cases/auth/register.dart' as _i10;
import '../app/data/use_cases/user/get_user.dart' as _i7;
import '../app/repositories/auth_repository.dart' as _i6;
import '../app/repositories/user_repository.dart' as _i5;
import 'modules/local_module.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  final localModule = _$LocalModule();
  gh.singleton<_i3.FlutterSecureStorage>(localModule.secureStorage);
  gh.factory<_i4.UserLocalStorage>(
      () => _i4.UserLocalStorage(get<_i3.FlutterSecureStorage>()));
  gh.factory<_i5.UserRepository>(
      () => _i5.UserRepository(get<_i4.UserLocalStorage>()));
  gh.factory<_i6.AuthRepository>(() => _i6.AuthRepository(
        get<_i4.UserLocalStorage>(),
        get<_i5.UserRepository>(),
      ));
  gh.singleton<_i7.GetUser>(_i7.GetUser(get<_i5.UserRepository>()));
  gh.singleton<_i8.Login>(_i8.Login(get<_i6.AuthRepository>()));
  gh.singleton<_i9.Logout>(_i9.Logout(get<_i6.AuthRepository>()));
  gh.singleton<_i10.Register>(_i10.Register(get<_i6.AuthRepository>()));
  return get;
}

class _$LocalModule extends _i11.LocalModule {}
