import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    // TODO: Implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // TODO: Implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // TODO: Implement logout
    throw UnimplementedError();
  }
}
