import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_del/core/failure/failure.dart';
import 'package:food_del/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:food_del/features/auth/domain/entity/auth_entity.dart';
import 'package:food_del/features/auth/domain/repository/auth_repository.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepositoy(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepositoy implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepositoy(this._authRemoteDataSource);

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }
  
  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
     return  _authRemoteDataSource.loginStudent(username, password);
  }
  
  
  @override
  Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
     return  _authRemoteDataSource.registerStudent(student);
  }
}
  // @override
  // Future<Either<Failure, bool>> loginStudent(String username, String password) {
  //   return _authRemoteDataSource.loginStudent(username, password);
  // }

  // @override
  // Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
  //   return _authRemoteDataSource.registerStudent(student);
  // }
