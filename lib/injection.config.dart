// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'core/global/firebase/firebase_injectable_module.dart' as _i16;
import 'core/global/hive/hive_helper.dart' as _i7;
import 'features/help/blocs/help_bloc/help_bloc.dart' as _i6;
import 'features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart' as _i13;
import 'features/login_and_sign_up/blocs/forgot_password_bloc/forgot_password_bloc.dart'
    as _i14;
import 'features/login_and_sign_up/blocs/login_bloc/login_bloc.dart' as _i15;
import 'features/login_and_sign_up/blocs/sign_up_bloc/sign_up_bloc.dart'
    as _i12;
import 'features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart'
    as _i8;
import 'features/login_and_sign_up/infrastructure/firebase_auth_facade.dart'
    as _i9;
import 'features/profile/blocs/profile_bloc/profile_bloc.dart' as _i10;
import 'features/settings/blocs/settings_bloc/settings_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i6.HelpBloc>(() => _i6.HelpBloc());
  gh.factory<_i7.HiveHelper>(() => _i7.HiveHelper());
  gh.lazySingleton<_i8.IAuthFacade>(() =>
      _i9.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.factory<_i10.ProfileBloc>(() => _i10.ProfileBloc());
  gh.factory<_i11.SettingsBloc>(() => _i11.SettingsBloc());
  gh.factory<_i12.SignUpBloc>(() => _i12.SignUpBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i14.ForgotPasswordBloc>(
      () => _i14.ForgotPasswordBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i15.LoginBloc>(
      () => _i15.LoginBloc(get<_i8.IAuthFacade>(), get<_i13.AuthBloc>()));
  return get;
}

class _$FirebaseInjectableModule extends _i16.FirebaseInjectableModule {}
