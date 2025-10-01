//##-------------------AUTH REPOSITORY-------------------------##
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../common/typedef/either_type.dart';
import '../../../core/network/api_services.dart';
import '../../../core/services/cache_service.dart';
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';

abstract interface class AuthRepository {
  //##-------------------USER SIGN IN-------------------------##
  FutureEither<String> signIn({required SignInModel signInModel});

  //##-------------------CUSTOMER REGISTER-------------------------##
  FutureEither<String> signUp({required SignUpModel signUpModel});

  //##-------------------SIGN OUT------------------------##
  FutureEither<String> signOut();
}

//##-------------------AUTH REPOSITORY IMPLEMENTATION-------------------------##
class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------USER SIGN IN-------------------------##
  @override
  FutureEither<String> signIn({required SignInModel signInModel}) async {
    final response = await _apiService.post<Map>(
      'auth/signin',
      data: {...signInModel.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) async {
      final authData = data['data'];

      await CacheServices.instance.setAuthToken(authData['token']);
      log(authData['token']);
      await CacheServices.instance.setUserRole(authData['user']?['role']);
      log(authData['user']?['role']);

      return Right(authData['user']?['role']);
    });
  }

  @override
  FutureEither<String> signUp({required SignUpModel signUpModel}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  FutureEither<String> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
