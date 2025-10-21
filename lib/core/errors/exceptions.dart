import 'dart:developer';

import 'package:dartz/dartz.dart';
import '/featuers/authPage/errors/auth_exception.dart';

import 'failure.dart';

typedef AsyncMethod<T> = Future<T> Function();

class ServerException implements Exception {
  final String message;
  const ServerException({this.message = 'server-exception'});
}

class CacheException implements Exception {
  final String message;
  const CacheException({this.message = 'cache-exception'});
}

///to avoid repeating code again and again we use just this class to catch and handle
///
///any exception or error happened
final class ExceptionsHandler {
  static Future<Either<Failure, T>> baseHelperMethod<T>(
      AsyncMethod<T> method) async {
    try {
      return Right(await method());
    } on ServerException catch (e, stack) {
      log('server exception stack: $stack');
      return Left(FailureMapper.fromException(e));
    } on AuthException catch (e, stack) {
      log('auth exception stack:: $stack');
      return Left(FailureMapper.fromException(e));
    } on CacheException catch (e, stack) {
      log('cache exception stack: $stack');
      return Left(FailureMapper.fromException(e));
    } on Exception catch (e, stack) {
      log('some exception stack:: $stack');
      return Left(FailureMapper.fromException(e));
    } catch (e) {
      return const Left(OtherFailure(errorMessage: 'some error happened'));
    }
  }
}
