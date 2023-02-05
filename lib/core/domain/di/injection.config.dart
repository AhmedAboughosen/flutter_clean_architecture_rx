// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../infrastructure/remoteDataSource/httpClient/remote_data_source_service.dart'
    as _i5;
import '../../../infrastructure/remoteDataSource/networkSettings/network_info.dart'
    as _i7;
import '../../data/repositories/login_repository_impl.dart' as _i4;
import '../blocs/login/login_bloc.dart' as _i8;
import '../validation/create_app_pin_validation.dart' as _i3;
import '../validation/login_validation.dart' as _i6;
import 'network_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

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
  final networkModule = _$NetworkModule();
  gh.factory<_i3.CreateAppPinValidation>(() => _i3.CreateAppPinValidation());
  gh.factory<_i4.LoginRepository>(() => _i4.LoginRepository(
      remoteDataSourceService: get<_i5.RemoteDataSourceService>()));
  gh.factory<_i6.LoginValidation>(() => _i6.LoginValidation());
  gh.factory<_i7.NetworkInfo>(() => networkModule.getNetworkInfo());
  gh.factory<_i5.RemoteDataSourceService>(
      () => networkModule.getHttpConnection(get<_i7.NetworkInfo>()));
  gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc(
        loginValidation: get<_i6.LoginValidation>(),
        loginRepository: get<_i4.LoginRepository>(),
      ));
  return get;
}

class _$NetworkModule extends _i9.NetworkModule {}
