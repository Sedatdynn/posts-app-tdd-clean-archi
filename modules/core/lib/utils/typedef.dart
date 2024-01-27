import 'package:core/exception/failures.dart';
import 'package:dartz/dartz.dart';

typedef DataMap = Map<String, dynamic>;
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef VoidFuture = ResultFuture<void>;
